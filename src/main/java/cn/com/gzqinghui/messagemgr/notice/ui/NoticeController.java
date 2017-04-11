
package cn.com.gzqinghui.messagemgr.notice.ui;
import cn.com.gzqinghui.common.util.Constants;
import cn.com.gzqinghui.messagemgr.notice.service.INoticeService;
import cn.com.gzqinghui.messagemgr.notice.vo.NoticeVO;
import cn.com.gzqinghui.sysmgr.common.util.DateUtil;
import cn.com.gzqinghui.sysmgr.common.util.FileUploadUtil;
import cn.com.gzqinghui.sysmgr.core.AppContext;
import cn.com.gzqinghui.sysmgr.log.annotation.SystemControllerLog;
import com.dexcoder.commons.pager.AcePageBean;
import com.dexcoder.dal.annotation.FormModel;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.Writer;
import java.util.Map;

/**
* 信息管理-通知管理管理
* 广州清汇信息科技有限公司
* date: 2017-04-06 09:50:19
*/
@Controller
@RequestMapping("/messagemgr/notice")
public class NoticeController {

    private static final Logger log = LoggerFactory.getLogger(NoticeController.class);

    @Autowired
    private INoticeService noticeService;

    /*
     * 获取通知管理列表
     */
    @RequestMapping(value = "/list",produces="application/json")
    @SystemControllerLog(model="通知管理模块",description="通知管理列表")
    public void list(@FormModel NoticeVO notice, @ModelAttribute AcePageBean pageBean, Writer out) throws Exception{

        JSONObject json = new JSONObject();

        try {
            Map<String, Object> notices = noticeService.queryListByPage(notice, pageBean);
            json.put("code","1");
            json.put("desc","查询成功");
            json.put("data",notices);
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","查询失败");
        }

        IOUtils.write(json.toString(),out);
    }

    /*
     * 新增通知管理
     */
    @RequestMapping(value = "/add",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="通知管理模块",description="新增通知管理")
    public void add(@FormModel NoticeVO notice,@RequestParam(required=false,value="upFile")MultipartFile upFile, Writer out,HttpServletRequest request) throws Exception{

        JSONObject json = new JSONObject();

        try {
            if(null != upFile){
                JSONObject ret = FileUploadUtil.fileUploadApk(request, upFile, Constants.PICPOSTFIX, "/upload/member" );
                if(ret.getBoolean("success")){
                    notice.setPurl(ret.getString("fileName"));
                }
            }

            notice.setCreatedate(DateUtil.formartCurrentDateTime());
            notice.setCreatorid(AppContext.getCurrentUser().getId());
            notice.setModifieddate(DateUtil.formartCurrentDateTime());
            notice.setModifiedid(AppContext.getCurrentUser().getId());
            notice.setDeletedflag("0");
            int row = noticeService.save(notice);
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
     * 编辑通知管理
     */
    @RequestMapping(value = "/update",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="通知管理模块",description="编辑通知管理")
    public void update(@FormModel NoticeVO notice,@RequestParam(required=false,value="upFile")MultipartFile upFile, Writer out,HttpServletRequest request) throws Exception{

        JSONObject json = new JSONObject();
        try {
            if(null != upFile){
                JSONObject ret = FileUploadUtil.fileUploadApk(request, upFile, Constants.PICPOSTFIX, "/upload/member" );
                if(ret.getBoolean("success")){
                    notice.setPurl(ret.getString("fileName"));
                }
            }
            notice.setModifieddate(DateUtil.formartCurrentDateTime());
            notice.setModifiedid(AppContext.getCurrentUser().getId());
                        int row = StringUtils.isNotBlank(notice.getId())
                      ? noticeService.update(notice)
                        :noticeService.save(notice);

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
     * 物理删除通知管理
     * 直接数据库delete
     */
    @RequestMapping(value = "/delete",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="通知管理模块",description="删除通知管理")
    public void delete(String ids, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            int row = noticeService.deleteByIds(NoticeVO.class,ids);
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
     * 逻辑删除通知管理
     * 数据库update
     */
    @RequestMapping(value = "/deleteLogicByIds",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="通知管理模块",description="删除通知管理")
    public void deleteLogicByIds(String ids, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            int row = noticeService.deleteLogicByIds(NoticeVO.class, ids, null);
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



    /*
     * 物理删除通知管理
     * 直接数据库delete
     */
    @RequestMapping(value = "/uploadFile",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="通知管理模块",description="上传附件")
    public void uploadFile(@RequestParam(required=false,value="upFile")MultipartFile upFile,String folder, Writer out,HttpServletRequest request) throws Exception{
        JSONObject json = new JSONObject();
        try {
            json = FileUploadUtil.fileUploadApk(request, upFile, Constants.ATTACHMENTPOSTFIX, "/upload/"+folder);
            json.put("realName",upFile.getOriginalFilename());
        } catch (Exception e) {
            e.printStackTrace();
            json.put("success", false);
            json.put("msg","上传附件失败");
        }

        IOUtils.write(json.toString(),out);
    }

}
