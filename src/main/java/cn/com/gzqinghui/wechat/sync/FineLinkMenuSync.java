package cn.com.gzqinghui.wechat.sync;

import cn.com.gzqinghui.wechat.bean.Button;
import cn.com.gzqinghui.wechat.common.ToWeChatUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by signheart on 2017/2/24.
 */
public class FineLinkMenuSync {

    public static void  menuCreateToFineLinkTech() throws Exception {
        List<Button> MenuList = new ArrayList<Button>();
        List<Button> subMenuList = new ArrayList<Button>();
        subMenuList = new ArrayList<Button>();
        Button menu = new Button();
        Button subMenu = new Button();
        menu.setName("我要买房");
        menu.setType("view");
        menu.setUrl("http://www.iguanfang.cn");
        MenuList.add(menu);

        subMenuList = new ArrayList<Button>();
        menu = new Button();
        subMenu = new Button();
        menu.setName("商家联盟");
        subMenu.setName("泛联早报");
        subMenu.setType("view");
        subMenu.setUrl("http://www.iguanfang.cn/mob/sign/zaobao");
        subMenuList.add(subMenu);

        subMenu = new Button();
        subMenu.setName("联盟伙伴");
        subMenu.setType("view");
        subMenu.setUrl("http://www.iguanfang.cn/IGuanFang/mob/house/lianmengList/");
        subMenuList.add(subMenu);
        menu.setSub_button(subMenuList);
        MenuList.add(menu);



        menu = new Button();
        menu.setName("客户报备");
        menu.setType("view");
        menu.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4047fc41bf03226a&redirect_uri=" + URLEncoder.encode("http://www.iguanfang.cn/crwechat/index/home","UTF-8")+ "&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");
        MenuList.add(menu);



        Map<String,Object> map = new HashMap<String, Object>();
        map.put("button", MenuList);
        Gson gson = new GsonBuilder().disableHtmlEscaping().create();
        String str = gson.toJson(map);
        System.out.println(str);
        System.out.println(ToWeChatUtil.updateWeChatMenu(str).getData());

    }

    public static void main(String[] args) throws Exception {
        menuCreateToFineLinkTech();
    }



}
