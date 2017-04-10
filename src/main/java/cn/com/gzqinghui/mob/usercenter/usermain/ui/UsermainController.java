
package cn.com.gzqinghui.mob.usercenter.usermain.ui;

import cn.com.gzqinghui.mob.usercenter.usermain.service.IUsermainService;
import cn.com.gzqinghui.wechat.common.WeChatAuthUtil;
import net.sf.json.JSONObject;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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






}
