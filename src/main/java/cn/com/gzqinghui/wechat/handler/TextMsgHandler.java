package cn.com.gzqinghui.wechat.handler;

import cn.com.gzqinghui.sysmgr.core.AppContext;
import cn.com.gzqinghui.wechat.bean.InMessage;
import cn.com.gzqinghui.wechat.bean.OutMessage;
import cn.com.gzqinghui.wechat.common.XStreamFactory;
import cn.com.gzqinghui.wechat.core.MsgHandlerForward;
import com.dexcoder.dal.JdbcDao;
import com.thoughtworks.xstream.XStream;
import org.apache.log4j.Logger;


/**
 * 文本消息处理者
 * @author ao.ouyang
 *
 */
public class TextMsgHandler implements IMsgHandler {
	private final static Logger log = Logger.getLogger(MsgHandlerForward.class);
	private OutMessage outMessage;
	private String outStr;
	private XStream xs;
	private JdbcDao jdbcDao;

	@Override
	public void init() {
		log.info(TextMsgHandler.class.getCanonicalName()+".init()....");
	}

	@Override
	public void beforeExec(InMessage inMessage) {
		// TODO Auto-generated method stub
		xs = XStreamFactory.init(true);
		jdbcDao =  (JdbcDao) AppContext.getSpringContext().getBean("jdbcDao");

	}

	@Override
	public void exec(InMessage inMessage) throws Exception {
		/*String kw = inMessage.getContent();
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
			articleslast.setUrl("http://" + ConfKit.get("wxAuthOpenUrl") + "/mob/esf/?keyword=" + URLEncoder.encode(URLEncoder.encode((String) ((Map) vlist.get(0)).get("VILLAGE_NAME"), "UTF-8"),"UTF-8"));
			articleslast.setPicUrl((String) ((Map) vlist.get(0)).get("First_PhotoURL"));
			articleslast.setTitle("查看更多二手房源");
			articleslast.setDescription(articleslast.getTitle());
			articlesList.add(articleslast);
			newsOutMessage.setArticles(articlesList);
			this.outMessage=newsOutMessage;
			xs.alias("item", Articles.class);
		}else{
			TextOutMessage outMessage = new TextOutMessage();
			outMessage.setContent("你输入的[" + kw + "]关键字未找到对应小区信息");
			this.outMessage = outMessage;
		}
		Tools.setMsgInfo(outMessage, inMessage);*/
	}

	@Override
	public void afterExec(InMessage inMessage) {
		xs.alias("xml", this.outMessage.getClass());
		outStr = xs.toXML(this.outMessage);
	}


	@Override
	public OutMessage doOutMessage() {
		// TODO Auto-generated method stub
		return outMessage;
	}

	@Override
	public String doOutStr() {
		// TODO Auto-generated method stub
		return outStr;
	}


}
