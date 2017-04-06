
package cn.com.gzqinghui.acitivtymgr.activity.ui;
import cn.com.gzqinghui.acitivtymgr.activity.vo.ActMembeRefVO;
import cn.com.gzqinghui.acitivtymgr.activity.vo.ActivityPhotoVO;
import cn.com.gzqinghui.acitivtymgr.member.vo.MemberVO;
import cn.com.gzqinghui.common.util.Constants;
import cn.com.gzqinghui.sysmgr.common.util.DateUtil;
import cn.com.gzqinghui.sysmgr.common.util.FileUploadUtil;
import cn.com.gzqinghui.sysmgr.core.AppContext;
import cn.com.gzqinghui.sysmgr.log.annotation.SystemControllerLog;
import cn.com.gzqinghui.acitivtymgr.activity.service.IActivityService;
import com.dexcoder.dal.build.Criteria;
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

import cn.com.gzqinghui.acitivtymgr.activity.vo.ActivityVO;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
* 五四活动管理-活动管理管理
* 广州清汇信息科技有限公司
* date: 2017-04-05 09:09:18
*/
@Controller
@RequestMapping("/acitivtymgr/activity")
public class ActivityController {

    private static final Logger log = LoggerFactory.getLogger(ActivityController.class);

    @Autowired
    private IActivityService activityService;

    /*
     * 获取活动管理列表
     */
    @RequestMapping(value = "/list",produces="application/json")
    @SystemControllerLog(model="活动管理模块",description="活动管理列表")
    public void list(@FormModel ActivityVO activity, @ModelAttribute AcePageBean pageBean, Writer out) throws Exception{

        JSONObject json = new JSONObject();

        try {
            Map<String, Object> activitys = activityService.queryListByPageAndWhere(activity, pageBean);

            json.put("code","1");
            json.put("desc","查询成功");
            json.put("data",activitys);
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","查询失败");
        }

        IOUtils.write(json.toString(),out);
    }



    /*
     * 获取活动管理列表
     */
    @RequestMapping(value = "/actmember/list",produces="application/json")
    @SystemControllerLog(model="活动管理模块",description="活动团员列表")
    public void actMemberlist(@ModelAttribute AcePageBean pageBean, Writer out) throws Exception{

        JSONObject json = new JSONObject();

        try {
            Map<String, Object> activitys = activityService.queryActMemberRowMapListByPage(pageBean);
            json.put("code","1");
            json.put("desc","查询成功");
            json.put("data",activitys);
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","查询失败");
        }

        IOUtils.write(json.toString(),out);
    }

    /*
     * 获取团员管理列表
     */
    @RequestMapping(value = "/actmember/import/list",produces="application/json")
    @SystemControllerLog(model="团员管理模块",description="活动团员导入列表")
    public void list(@FormModel MemberVO member, @ModelAttribute AcePageBean pageBean,Writer out) throws Exception{

        JSONObject json = new JSONObject();

        try {
            Map<String, Object> members = activityService.queryActMemberImportListRowMapListByPage(pageBean);
            json.put("code","1");
            json.put("desc","查询成功");
            json.put("data",members);
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","查询失败");
        }

        IOUtils.write(json.toString(),out);
    }

    /*
     * 获取活动图片列表
     */
    @RequestMapping(value = "/actphoto/list")
    @SystemControllerLog(model="活动管理模块",description="活动管理列表")
    public void actPhotolist(HttpServletRequest request,HttpServletResponse response) throws Exception{
        List activityphotos = activityService.queryPhotoList(new ActivityPhotoVO());
        request.setAttribute("activityphotos",activityphotos);
        request.getRequestDispatcher("/jsp/acitivtymgr/activity/activityphoto_list.jsp").forward(request, response);
    }



    /*
     * 导入团员
     */
    @RequestMapping(value = "/import/actmember",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="活动管理模块",description="导入活动团员")
    public void add(String id,String memberids,Writer out) throws Exception{

        JSONObject json = new JSONObject();

        try {
            activityService.importActMemeber(id,memberids);
            json.put("code","1");
            json.put("desc","新增成功");
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","新增失败");
        }

        IOUtils.write(json.toString(), out);
    }



    /*
     * 新增活动管理
     */
    @RequestMapping(value = "/add",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="活动管理模块",description="新增活动管理")
    public void add(@FormModel ActivityVO activity, @RequestParam(required=false,value="upFile")MultipartFile upFile, Writer out,HttpServletRequest request) throws Exception{

        JSONObject json = new JSONObject();

        try {
            if(null != upFile){
                JSONObject ret = FileUploadUtil.fileUploadApk(request, upFile, Constants.PICPOSTFIX, "/upload/activity");
                if(ret.getBoolean("success")){
                    activity.setHomepagep(ret.getString("fileName"));
                }
            }

            activity.setCreatedate(DateUtil.formartCurrentDateTime());
            activity.setCreatorid(AppContext.getCurrentUser().getId());
            activity.setModifieddate(DateUtil.formartCurrentDateTime());
            activity.setModifiedid(AppContext.getCurrentUser().getId());
            activity.setDeletedflag("0");
            int row = activityService.save(activity);
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
     * 新增活动图片
     */
    @RequestMapping(value = "/actphoto/add",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="活动管理模块",description="新增活动管理")
    public void add(String id,@RequestParam(required=false,value="upFile")MultipartFile upFile, Writer out,HttpServletRequest request) throws Exception{

        JSONObject json = new JSONObject();

        try {
            ActivityPhotoVO activityPhotoVO = new ActivityPhotoVO();
            if(null != upFile){
                JSONObject ret = FileUploadUtil.fileUploadApk(request, upFile, Constants.PICPOSTFIX, "/upload/activity");
                if(ret.getBoolean("success")){
                    activityPhotoVO.setPurl(ret.getString("fileName"));
                }
            }
            activityPhotoVO.setActId(id);
            activityPhotoVO.setId(UUID.randomUUID().toString());

            activityPhotoVO.setCreatedate(DateUtil.formartCurrentDateTime());
            activityPhotoVO.setCreatorid(AppContext.getCurrentUser().getId());
            activityPhotoVO.setModifieddate(DateUtil.formartCurrentDateTime());
            activityPhotoVO.setModifiedid(AppContext.getCurrentUser().getId());
            activityPhotoVO.setDeletedflag("0");
            int row = activityService.save(activityPhotoVO);
            if(row < 1){
                throw new Exception("新增失败");
            }
            HashMap hashMap = new HashMap();
            hashMap.put("vo",activityPhotoVO);
            json.put("data",hashMap);
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
     * 编辑活动管理
     */
    @RequestMapping(value = "/update",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="活动管理模块",description="编辑活动管理")
    public void update(@FormModel ActivityVO activity,@RequestParam(required=false,value="upFile")MultipartFile upFile, Writer out,HttpServletRequest request) throws Exception{

        JSONObject json = new JSONObject();

        if(null != upFile){
            JSONObject ret = FileUploadUtil.fileUploadApk(request, upFile, Constants.PICPOSTFIX, "/upload/activity" );
            if(ret.getBoolean("success")){
                activity.setHomepagep(ret.getString("fileName"));
            }
        }
        activity.setModifieddate(DateUtil.formartCurrentDateTime());
        activity.setModifiedid(AppContext.getCurrentUser().getId());

        try {
                        int row = StringUtils.isNotBlank(activity.getId())
                      ? activityService.update(activity)
                        :activityService.save(activity);

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
     * 物理删除活动管理
     * 直接数据库delete
     */
    @RequestMapping(value = "/delete",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="活动管理模块",description="删除活动管理")
    public void delete(String ids, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            int row = activityService.deleteByIds(ActivityVO.class,ids);
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
     * 逻辑删除活动管理
     * 数据库update
     */
    @RequestMapping(value = "/deleteLogicByIds",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="活动管理模块",description="删除活动管理")
    public void deleteLogicByIds(String ids, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            int row = activityService.deleteLogicByIds(ActivityVO.class, ids, null);
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
     * 物理删除活动管理
     * 直接数据库delete
     */
    @RequestMapping(value = "/actmember/delete",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="活动管理模块",description="删除活动管理")
    public void actMemberDelete(String ids, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            int row = activityService.deleteByIds(ActMembeRefVO.class, ids);
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
     * 物理删除活动轮播图片
     * 直接数据库delete
     */
    @RequestMapping(value = "/actphoto/delete",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="活动管理模块",description="删除活动图片")
    public void actPhotoDelete(String ids, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            int row = activityService.deleteByIds(ActivityPhotoVO.class, ids);
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

}
