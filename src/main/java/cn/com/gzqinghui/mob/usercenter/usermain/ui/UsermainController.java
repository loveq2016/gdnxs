
package cn.com.gzqinghui.mob.usercenter.usermain.ui;

import cn.com.gzqinghui.acitivtymgr.member.vo.MemberVO;
import cn.com.gzqinghui.common.util.Constants;
import cn.com.gzqinghui.mob.usercenter.usermain.service.IUsermainService;
import cn.com.gzqinghui.sysmgr.common.util.FileUploadUtil;
import cn.com.gzqinghui.wechat.common.WeChatAuthUtil;
import net.sf.json.JSONObject;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;
import java.util.Map;

/**
* 广州清汇信息科技有限公司
* date: 2017-04-05 09:09:18
*/
@Controller
@RequestMapping("/mob/usermain")
public class UsermainController {

    private static final Logger log = LoggerFactory.getLogger(UsermainController.class);

    @Resource
    private IUsermainService mobUsermainService;


    /*
    * 用户中心
    */
    @RequestMapping(value = "/")
    public String usermain(HttpServletRequest request) throws Exception{
        WeChatAuthUtil.getInstance().getUserInfo();
        if(null ==request.getSession().getAttribute("_sysuserinfo")){
            return "/mobapp/usercenter/usermain/user_bind";
        }

        return "/mobapp/usercenter/usermain/usermain";
    }

    /**
     * 用户绑定
     * @param request
     * @param name
     * @param birthday
     * @param out
     * @throws Exception
     */
    @RequestMapping(value = "/user/bind",produces="application/json")
    public void userBind(HttpServletRequest request,String name,String birthday, Writer out) throws Exception{
        JSONObject json = new JSONObject();

        try {
           Map userinfo =  mobUsermainService.userBind(name,birthday);
           request.getSession().setAttribute("_sysuserinfo", userinfo);
           json.put("code","1");
           json.put("desc","投票成功");
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc",e.getMessage());
        }

        IOUtils.write(json.toString(), out);
    }


    /*
    * 个人资料完善
    */
    @RequestMapping(value = "/userinfo",method = RequestMethod.GET)
    public String userinfo(HttpServletRequest request) throws Exception{
        WeChatAuthUtil.getInstance().getUserInfo();
        return "/mobapp/usercenter/usermain/userinfo";
    }


    @RequestMapping(value = "/userinfo",produces="application/json",method = RequestMethod.POST)
    public void userinfo(HttpServletRequest request,MemberVO member, Writer out) throws Exception{
        JSONObject json = new JSONObject();

        try {
            Map userinfo =  mobUsermainService.editUserinfo(member);
            request.getSession().setAttribute("_sysuserinfo", userinfo);
            json.put("code","1");
            json.put("desc","修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc",e.getMessage());
        }

        IOUtils.write(json.toString(), out);
    }

    /*
    * 上传
    */
    @RequestMapping(value = "/uploadAvatar", produces = "application/json",method = RequestMethod.POST)
    public void uploadAvatar(HttpServletResponse response, HttpServletRequest request,MultipartFile upFile, String folder, Writer out) throws IOException {
        JSONObject json = new JSONObject();

        try {
            org.json.JSONObject jso = FileUploadUtil.fileUploadApk(request, upFile, Constants.PICPOSTFIX, "/upload/" + folder);
            if(jso.getBoolean("success")){
                Map userinfo =  mobUsermainService.editUserAvatar(jso.getString("fileName"));
                request.getSession().setAttribute("_sysuserinfo", userinfo);
                json.put("code","1");
                json.put("desc","修改成功");
            }else{
                json.put("code","0");
                json.put("desc","修改失败");
            }

        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc",e.getMessage());
        }

        IOUtils.write(json.toString(), out);

    }


    /*
    * 通知列表
    */
    @RequestMapping(value = "/notice/list",method = RequestMethod.GET)
    public String notice(HttpServletRequest request) throws Exception{
        request.setAttribute("noticelist", mobUsermainService.listNotice());
        return "/mobapp/usercenter/usermain/notice_list";
    }



    /*
    * 通知列表
    */
    @RequestMapping(value = "/notice/detail",method = RequestMethod.GET)
    public String noticeDetail(HttpServletRequest request,String id) throws Exception{
        request.setAttribute("notice", mobUsermainService.searchNoticeDetail(id));
        return "/mobapp/usercenter/usermain/notice_detail";
    }


    /*
    * 消息列表
    */
    @RequestMapping(value = "/msg/list",method = RequestMethod.GET)
    public String msgList(HttpServletRequest request,String id) throws Exception{
        request.setAttribute("msglist", mobUsermainService.listMsg());
        return "/mobapp/usercenter/usermain/msg_list";
    }


    /*
   * 问题列表
   */
    @RequestMapping(value = "/faq/list",method = RequestMethod.GET)
    public String faqList(HttpServletRequest request) throws Exception{
        request.setAttribute("faqlist", mobUsermainService.listFaq());
        return "/mobapp/usercenter/usermain/faq_list";
    }


    @RequestMapping(value = "/faq/detail",method = RequestMethod.GET)
    public String faqDetail(HttpServletRequest request,String id) throws Exception{
        request.setAttribute("faq", mobUsermainService.searchFaqDetail(id));
        return "/mobapp/usercenter/usermain/faq_detail";
    }


}
