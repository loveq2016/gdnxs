
package cn.com.gzqinghui.mob.index.activity.ui;

import cn.com.gzqinghui.mob.index.activity.service.IMobActivityService;
import cn.com.gzqinghui.sysmgr.common.util.QrcodeUtil;
import cn.com.gzqinghui.sysmgr.common.util.ValidateUtil;
import cn.com.gzqinghui.wechat.common.WeChatAuthUtil;
import net.sf.json.JSONObject;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Writer;
import java.net.URLDecoder;
import java.util.Map;

/**
* 广州清汇信息科技有限公司
* date: 2017-04-05 09:09:18
*/
@Controller
@RequestMapping("/mob/index")
public class MobActivityController {

    private static final Logger log = LoggerFactory.getLogger(MobActivityController.class);

    @Autowired
    private IMobActivityService mobActivityService;

    /*
     * 获取活动列表
     */
    @RequestMapping(value = "/act/list")
    public String list(HttpServletRequest request) throws Exception{
        request.setAttribute("actCarousel",mobActivityService.searchActivityHomeCarousel());
        request.setAttribute("actList",mobActivityService.searchActivityHome());
        return "/mobapp/index/activity/activity_list";
    }

    /*
     * 获取活动历史列表
     */
    @RequestMapping(value = "/act/history/list")
    public String list(HttpServletRequest request,String kw) throws Exception{
        request.setAttribute("actCarousel",mobActivityService.searchActivityHomeCarousel());
        request.setAttribute("actList",mobActivityService.searchActivityHomeHistory(URLDecoder.decode(null == kw ? "" : kw, "UTF-8")));
        return "/mobapp/index/activity/activityhistory_list";
    }

    /*
     * 获取活动详情
     */
    @RequestMapping(value = "/act/detail")
    public String detail(HttpServletRequest request,String id) throws Exception{
        request.getSession().removeAttribute("_userinfo");
        request.getSession().removeAttribute("_sysuserinfo");
        WeChatAuthUtil.getInstance().getUserInfo();
        Map act = (Map) mobActivityService.searchActivityDetail(id);
        request.setAttribute("act",act);
        request.getSession().setAttribute("actid",act.get("id"));
        request.setAttribute("actmemberlist",mobActivityService.searchActivityDetailMemberList(id));
        request.setAttribute("actphotolist",mobActivityService.searchActivityDetailPhotoList(id));
        return "/mobapp/index/activity/activity_detail";
    }


    /*
     * 获取个人简介
     */
    @RequestMapping(value = "/act/member/detail")
    public String actMemberdetail(HttpServletRequest request,String id,String actid) throws Exception{
        request.setAttribute("act",mobActivityService.searchActivityDetail(actid));
        request.setAttribute("member",mobActivityService.searchActivityMemberDetail(id, actid));
        return "/mobapp/index/activity/activitymember_detail";
    }

    /*
    * 获取拉票海报
    */
    @RequestMapping(value = "/act/member/poster")
    public String actMemberposter(HttpServletRequest request,String id,String actid) throws Exception{
        request.setAttribute("member",mobActivityService.searchActivityMemberDetail(id,actid));
        return "/mobapp/index/activity/activitymember_poster";
    }

    /*
    * 获取拉票海报
    */
    @RequestMapping(value = "/act/member/poster/qrcode")
    public void actMemberposter(HttpServletRequest request,HttpServletResponse response,String id,String actid) throws Exception{
        String   baseURL   =   request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
        String url = baseURL+"/act/member/detail/?id="+id+"&actid="+actid;
        QrcodeUtil.QrcodeImg(url, response);
    }

    /*
     * 获取活动简介
     */
    @RequestMapping(value = "/act/desc")
    public String actMemberdetail(HttpServletRequest request,String id) throws Exception{
        request.setAttribute("act", mobActivityService.searchActivityDetail(id));
        return "/mobapp/index/activity/activity_desc";
    }




    /*
     * 获取活动排行
     */
    @RequestMapping(value = "/act/top")
    public String actTop(HttpServletRequest request,String id) throws Exception{
        request.setAttribute("acttoplist", mobActivityService.searchActivityTopList(id));
        return "/mobapp/index/activity/activity_top";
    }


    /*
     * 投票
     */
    @RequestMapping(value = "/act/vote",produces="application/json")
    public void actTop(HttpServletRequest request,String id,String actid, Writer out) throws Exception{
        JSONObject json = new JSONObject();

        try {
            mobActivityService.actVote(id,actid);
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
     * 获取活动排行
     */
    @RequestMapping(value = "/act/search")
    public String actMemberSearch(HttpServletRequest request,String id,String kw) throws Exception{
        if(!ValidateUtil.isNullOrBlank(kw)){
            Map member = mobActivityService.searchActMember(id,kw);
            if(null == member){
                request.setAttribute("msg","未找到对应的团员信息");
                return "/mobapp/index/activity/activitymember_search";
            }else{
                String   baseURL   =   request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
                return "redirect:"+baseURL+"/mob/index/act/member/detail?id="+member.get("id")+"&actid="+id;
            }

        }
        return "/mobapp/index/activity/activitymember_search";
    }


}
