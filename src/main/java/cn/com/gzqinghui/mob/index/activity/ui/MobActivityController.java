
package cn.com.gzqinghui.mob.index.activity.ui;

import cn.com.gzqinghui.mob.index.activity.service.IMobActivityService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;

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
        request.setAttribute("actList",mobActivityService.searchActivityHomeHistory(URLDecoder.decode(kw, "UTF-8")));
        return "/mobapp/index/activity/activityhistory_list";
    }

    /*
     * 获取活动详情
     */
    @RequestMapping(value = "/act/detail")
    public String detail(HttpServletRequest request,String id) throws Exception{
        request.setAttribute("act",mobActivityService.searchActivityDetail(id));
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
        request.setAttribute("member",mobActivityService.searchActivityMemberDetail(id));
        return "/mobapp/index/activity/activitymember_detail";
    }

    /*
     * 获取活动简介
     */
    @RequestMapping(value = "/act/desc")
    public String actMemberdetail(HttpServletRequest request,String id) throws Exception{
        request.setAttribute("act",mobActivityService.searchActivityDetail(id));
        return "/mobapp/index/activity/activity_desc";
    }

    /*
     * 获取活动排行
     */
    @RequestMapping(value = "/act/top")
    public String actTop(HttpServletRequest request,String id) throws Exception{
        request.setAttribute("acttoplist",mobActivityService.searchActivityTopList(id));
        return "/mobapp/index/activity/activity_top";
    }



}
