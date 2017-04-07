package cn.com.gzqinghui.wechat.test;

import com.thoughtworks.xstream.XStream;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by signheart on 2017/2/27.
 */
public class TestCase {
    /*private XStream xs;
    private OutMessage outMessage;
    public TestCase(){
        xs = XStreamFactory.init(true);
    }


    public static void  main(String[] args) throws Exception {
        String str = "http://www.iguanfang.cn/mob/esf/?keyword=%25E9%2587%2591%25E6%25B1%2587107";
        *//*String str = "http://www.iguanfang.cn/mob/esf/?keyword=%E9%87%91%E6%B1%87107" ;
        String str = "http://www.iguanfang.cn/mob/esf/?keyword=金汇107" ;*//*
        String enstr=null;
        String destr =null;
        enstr = URLEncoder.encode(str, "UTF-8");
        destr = URLDecoder.decode(URLDecoder.decode(URLDecoder.decode(URLDecoder.decode(enstr, "UTF-8"), "UTF-8"),"UTF-8"),"UTF-8");
        System.out.println("en--"+enstr);
        System.out.println("de--"+destr);


    }



    public void afterExec() {
        xs.alias("xml", this.outMessage.getClass());
        System.out.println(xs.toXML(this.outMessage));
    }

    public void testvillagephoto() throws Exception {
        ApplicationContext appctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        IVillageDAO villageDAO = (IVillageDAO) appctx.getBean("villageDAO");
        String kw = "107";
        List vlist = villageDAO.searchVillageList(kw);
        if(vlist.size()>0){
            NewsOutMessage newsOutMessage = new NewsOutMessage();
            List<Articles> articlesList = new ArrayList<>();
            newsOutMessage.setArticleCount(vlist.size());
            for(Object o : vlist){
                Map obj  = (Map) o;
                Articles articles = new Articles();
                articles.setPicUrl((String) obj.get("First_PhotoURL"));
                articles.setUrl("http://" + ConfKit.get("wxAuthOpenUrl") + "/mob/village/detail?id=" + obj.get("FY_VILLAGEID"));
                articles.setTitle(obj.get("VILLAGE_NAME") + "小区：管房网 在售二手房" + obj.get("SeconHouse_Sets") + "套，出租房" + obj.get("RentHouse_Sets") + "套，资产房" + obj.get("AssetHouse_Sets") + "套");
                articles.setDescription(articles.getTitle());
                articlesList.add(articles);
            }
            Articles articleslast = new Articles();
            articleslast.setUrl("http://" + ConfKit.get("wxAuthOpenUrl") + "/mob/esf/?keyword=" + URLEncoder.encode((String) ((Map) vlist.get(0)).get("VILLAGE_NAME"), "UTF-8"));

            System.out.println("-----------" + URLDecoder.decode(articleslast.getUrl()));
            articleslast.setPicUrl((String) ((Map) vlist.get(0)).get("First_PhotoURL"));
            articleslast.setTitle("查看更多二手房源");
            articleslast.setDescription(articleslast.getTitle());
            articlesList.add(articleslast);
            newsOutMessage.setArticles(articlesList);
            this.outMessage=newsOutMessage;
            xs.alias("item", Articles.class);
        }else{
            TextOutMessage outMessage = new TextOutMessage();
            outMessage.setContent("你输入的[" + kw + "]关键字未找到对应房源");
            this.outMessage = outMessage;
        }


        afterExec();

    }*/


}
