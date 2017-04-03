
package cn.com.gzqinghui.sysextmgr.mvoice.ui;
import cn.com.gzqinghui.sysmgr.log.annotation.SystemControllerLog;
import cn.com.gzqinghui.sysextmgr.mvoice.service.IMvoiceService;
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

import cn.com.gzqinghui.sysextmgr.mvoice.vo.MvoiceVO;
import java.io.Writer;
import java.util.Map;
import java.util.UUID;

/**
* 系统管理-代码生成器管理
* 广州清汇信息科技有限公司
* date: 2017-03-24 13:36:19
*/
@Controller
@RequestMapping("/sysextmgr/mvoice")
public class  MvoiceController {

    private static final Logger log = LoggerFactory.getLogger(MvoiceController.class);

    @Autowired
    private IMvoiceService mvoiceService;

    /*
     * 获取代码生成器列表
     */
    @RequestMapping(value = "/list",produces="application/json")
    @SystemControllerLog(model="代码生成器模块",description="代码生成器列表")
    public void list(@FormModel MvoiceVO mvoice, @ModelAttribute AcePageBean pageBean, Writer out) throws Exception{

        JSONObject json = new JSONObject();

        try {
            Map<String, Object> mvoices = mvoiceService.queryListByPage(mvoice, pageBean);
            json.put("code","1");
            json.put("desc","查询成功");
            json.put("data",mvoices);
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","查询失败");
        }

        IOUtils.write(json.toString(),out);
    }

    /*
     * 新增代码生成器
     */
    @RequestMapping(value = "/add",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="代码生成器模块",description="新增代码生成器")
    public void add(@FormModel MvoiceVO mvoice, Writer out) throws Exception{

        JSONObject json = new JSONObject();

        try {
            int row = mvoiceService.save(mvoice);
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
     * 编辑代码生成器
     */
    @RequestMapping(value = "/update",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="代码生成器模块",description="编辑代码生成器")
    public void update(@FormModel MvoiceVO mvoice, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
                        int row = StringUtils.isNotBlank(mvoice.getId())
                      ? mvoiceService.update(mvoice)
                        :mvoiceService.save(mvoice);

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
     * 物理删除代码生成器
     * 直接数据库delete
     */
    @RequestMapping(value = "/delete",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="代码生成器模块",description="删除代码生成器")
    public void delete(String ids, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            int row = mvoiceService.deleteByIds(MvoiceVO.class,ids);
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
     * 逻辑删除代码生成器
     * 数据库update
     */
    @RequestMapping(value = "/deleteLogicByIds",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="代码生成器模块",description="删除代码生成器")
    public void deleteLogicByIds(String ids, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            int row = mvoiceService.deleteLogicByIds(MvoiceVO.class,ids,null);
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
