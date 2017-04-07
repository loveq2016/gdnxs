package cn.com.gzqinghui.wechat.handler;

import cn.com.gzqinghui.sysmgr.core.AppContext;
import cn.com.gzqinghui.wechat.basic.WeChatCommonResult;
import cn.com.gzqinghui.wechat.bean.InMessage;
import cn.com.gzqinghui.wechat.bean.OutMessage;
import cn.com.gzqinghui.wechat.bean.TextOutMessage;
import cn.com.gzqinghui.wechat.common.ToWeChatUtil;
import cn.com.gzqinghui.wechat.common.Tools;
import cn.com.gzqinghui.wechat.common.XStreamFactory;
import com.dexcoder.dal.JdbcDao;
import com.thoughtworks.xstream.XStream;

import java.util.Map;

/**
 * 事件消息处理者
 * @author ao.ouyang
 *
 */
public class EventMsgHandler implements IMsgHandler{
	private OutMessage outMessage;
	private String outStr;
	private XStream xs;
	private JdbcDao jdbcDao;

	@Override
	public void init() {
	}

	@Override
	public void beforeExec(InMessage inMessage) {
		xs = XStreamFactory.init(true);
		jdbcDao =  (JdbcDao) AppContext.getSpringContext().getBean("jdbcDao");
	}

	@Override
	public void exec(InMessage inMessage) throws Exception {
		/*if(inMessage.getEvent().equalsIgnoreCase("subscribe")){
			//关注
			WeChatCommonResult commonResult = ToWeChatUtil.getAppUserInfo(inMessage.getFromUserName());
			if(commonResult.getCode()!=0){
				throw new Exception(commonResult.getDesc());
			}
			Map wxUser =  commonResult.getData();
			TextOutMessage outMessage = new TextOutMessage();
			outMessage.setContent("hello");
			Map user = (Map) poruserDAO.searchAllUserByOpenid(inMessage.getFromUserName());
			if(null != user){
				outMessage.setContent("hello,"+user.get("PERSON_NAME"));
				if(user.get("User_Type").toString().equals("0")){
					VisitsrecVO visitsrecVO = shareDAO.searchUserVisit(user.get("USER_ID").toString());
					if(null!=visitsrecVO){
						Map pushPerson = (Map) poruserDAO.searchShareUserById(visitsrecVO.getRefereeUserid());
						poruserDAO.updatePorUserPushUser(user.get("USER_ID").toString(), pushPerson.get("USER_ID").toString());
						outMessage.setContent("hello,"+user.get("PERSON_NAME")+",你的推荐人是:"+pushPerson.get("PERSON_NAME"));
						shareDAO.delAllUserVisit(user.get("USER_ID").toString());
					}
				}
			}
			outMessage.setContent(outMessage.getContent()+",想了解小区的真实房源资料，请回复小区名，如：恒大御湖");
			Tools.setMsgInfo(outMessage, inMessage);
			this.outMessage = outMessage;
		}*/

	}
	@Override
	public void afterExec(InMessage inMessage) {
		xs.alias("xml", this.outMessage.getClass());
		outStr = xs.toXML(this.outMessage);
	}

	@Override
	public OutMessage doOutMessage() {
		return outMessage;
	}

	@Override
	public String doOutStr() {
		return outStr;
	}
	

}
