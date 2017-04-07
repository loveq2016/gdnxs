
package cn.com.gzqinghui.faqinfomgr.faqinfomgr.ui;
import cn.com.gzqinghui.sysmgr.common.util.DateUtil;
import cn.com.gzqinghui.sysmgr.core.AppContext;
import cn.com.gzqinghui.sysmgr.log.annotation.SystemControllerLog;
import cn.com.gzqinghui.faqinfomgr.faqinfomgr.service.IFaqService;
import org.apache.commons.lang3.StringUtils;
import com.dexcoder.commons.pager.AcePageBean;
import com.dexcoder.dal.annotation.FormModel;
import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.com.gzqinghui.faqinfomgr.faqinfomgr.vo.FaqVO;
import java.io.Writer;
import java.util.Map;
import java.util.UUID;

/**
* 问题管理-问题管理管理
* 广州清汇信息科技有限公司
* date: 2017-04-07 09:54:40
*/
@Controller
@RequestMapping("/faqinfomgr/faqinfomgr")
public class FaqController {

    private static final Logger log = LoggerFactory.getLogger(FaqController.class);

    @Autowired
    private IFaqService faqService;

    /*
     * 获取问题管理列表
     */
    @RequestMapping(value = "/list",produces="application/json")
    @SystemControllerLog(model="问题管理模块",description="问题管理列表")
    public void list(@FormModel FaqVO faq, @ModelAttribute AcePageBean pageBean, Writer out) throws Exception{

        JSONObject json = new JSONObject();

        try {
            Map<String, Object> faqs = faqService.queryListByPage(faq, pageBean);
            json.put("code","1");
            json.put("desc","查询成功");
            json.put("data",faqs);
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","查询失败");
        }

        IOUtils.write(json.toString(),out);
    }

    /*
     * 新增问题管理
     */
    @RequestMapping(value = "/add",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="问题管理模块",description="新增问题管理")
    public void add(@FormModel FaqVO faq, Writer out) throws Exception{

        JSONObject json = new JSONObject();

        try {
            faq.setCreatedate(DateUtil.formartCurrentDateTime());
            faq.setCreatorid(AppContext.getCurrentUser().getId());
            faq.setModifieddate(DateUtil.formartCurrentDateTime());
            faq.setModifiedid(AppContext.getCurrentUser().getId());
            faq.setDeletedflag("0");
            int row = faqService.save(faq);
            if(row < 1){
                throw new Exception("新增失败");
            }
            json.put("code","1");
            json.put("desc","新增成功");
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","新增失败");
        }

        IOUtils.write(json.toString(),out);
    }

    /*
     * 编辑问题管理
     */
    @RequestMapping(value = "/update",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="问题管理模块",description="编辑问题管理")
    public void update(@FormModel FaqVO faq, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            faq.setModifieddate(DateUtil.formartCurrentDateTime());
            faq.setModifiedid(AppContext.getCurrentUser().getId());
                        int row = StringUtils.isNotBlank(faq.getId())
                      ? faqService.update(faq)
                        :faqService.save(faq);

            if(row < 1){
                throw new Exception("编辑失败");
            }
            json.put("code","1");
            json.put("desc","编辑成功");
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","编辑失败");
        }
        IOUtils.write(json.toString(),out);
    }

    /*
     * 物理删除问题管理
     * 直接数据库delete
     */
    @RequestMapping(value = "/delete",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="问题管理模块",description="删除问题管理")
    public void delete(String ids, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            int row = faqService.deleteByIds(FaqVO.class,ids);
            if(row < 1){
                throw new Exception("删除失败");
            }
            json.put("code","1");
            json.put("desc","删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","删除失败");
        }
        IOUtils.write(json.toString(),out);
    }

    /*
     * 逻辑删除问题管理
     * 数据库update
     */
    @RequestMapping(value = "/deleteLogicByIds",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="问题管理模块",description="删除问题管理")
    public void deleteLogicByIds(String ids, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            int row = faqService.deleteLogicByIds(FaqVO.class,ids,null);
            if(row < 1) {
                throw new Exception("删除失败");
            }
            json.put("code","1");
            json.put("desc","删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","删除失败");
        }

        IOUtils.write(json.toString(),out);
    }

}
