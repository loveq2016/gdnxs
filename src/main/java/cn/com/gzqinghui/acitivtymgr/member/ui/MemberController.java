
package cn.com.gzqinghui.acitivtymgr.member.ui;
import cn.com.gzqinghui.common.util.Constants;
import cn.com.gzqinghui.sysmgr.common.util.FileUploadUtil;
import cn.com.gzqinghui.sysmgr.log.annotation.SystemControllerLog;
import cn.com.gzqinghui.acitivtymgr.member.service.IMemberService;
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

import cn.com.gzqinghui.acitivtymgr.member.vo.MemberVO;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;
import java.util.Map;
import java.util.UUID;

/**
* 活动管理-团员管理管理
* 广州清汇信息科技有限公司
* date: 2017-04-03 13:21:54
*/
@Controller
@RequestMapping("/acitivtymgr/member")
public class MemberController {

    private static final Logger log = LoggerFactory.getLogger(MemberController.class);

    @Autowired
    private IMemberService memberService;

    /*
     * 获取团员管理列表
     */
    @RequestMapping(value = "/list",produces="application/json")
    @SystemControllerLog(model="团员管理模块",description="团员管理列表")
    public void list(@FormModel MemberVO member, @ModelAttribute AcePageBean pageBean,Writer out) throws Exception{

        JSONObject json = new JSONObject();

        try {
            Map<String, Object> members = memberService.queryListByPage(member, pageBean);
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
     * 新增团员管理
     */
    @RequestMapping(value = "/add",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="团员管理模块",description="新增团员管理")
    public void add(@FormModel MemberVO member,@RequestParam(required=false,value="upFile")MultipartFile upFile, Writer out,HttpServletRequest request) throws Exception{

        JSONObject json = new JSONObject();

        try {
            if(null != upFile){
                JSONObject ret = FileUploadUtil.fileUploadApk(request, upFile, Constants.PICPOSTFIX, "/upload/member" );
                if(ret.getBoolean("success")){
                    member.setAvatar(ret.getString("fileName"));
                }
            }

            int row = memberService.save(member);
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
     * 编辑团员管理
     */
    @RequestMapping(value = "/update",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="团员管理模块",description="编辑团员管理")
    public void update(@FormModel MemberVO member,@RequestParam(required=false,value="upFile")MultipartFile upFile, Writer out,HttpServletRequest request) throws Exception{

        JSONObject json = new JSONObject();
        try {
            if(null != upFile){
                JSONObject ret = FileUploadUtil.fileUploadApk(request, upFile, Constants.PICPOSTFIX, "/upload/member" );
                if(ret.getBoolean("success")){
                    member.setAvatar(ret.getString("fileName"));
                }
            }

                        int row = StringUtils.isNotBlank(member.getId())
                      ? memberService.update(member)
                        :memberService.save(member);

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
     * 物理删除团员管理
     * 直接数据库delete
     */
    @RequestMapping(value = "/delete",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="团员管理模块",description="删除团员管理")
    public void delete(String ids, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            int row = memberService.deleteByIds(MemberVO.class,ids);
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
     * 逻辑删除团员管理
     * 数据库update
     */
    @RequestMapping(value = "/deleteLogicByIds",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="团员管理模块",description="删除团员管理")
    public void deleteLogicByIds(String ids, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            int row = memberService.deleteLogicByIds(MemberVO.class, ids, null);
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
    * 上传
    */
    @RequestMapping(value = "/uploadImg", produces = "application/json")
    public void uploadImg(HttpServletResponse response, HttpServletRequest request,MultipartFile upFile, String folder) throws IOException {
		/*if(removeFile != null && !"".equals(removeFile)){
			this.removeFile(request,  removeFile);
		}*/
        //开始上传
        JSONObject json = FileUploadUtil.fileUploadApk(request, upFile, Constants.PICPOSTFIX, "/upload/" + folder);

        //输出结果
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        response.getWriter().write(json.toString());
    }

}
