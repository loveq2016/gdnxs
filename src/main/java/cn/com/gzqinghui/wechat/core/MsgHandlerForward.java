package cn.com.gzqinghui.wechat.core;

import cn.com.gzqinghui.wechat.bean.InMessage;
import cn.com.gzqinghui.wechat.handler.EventMsgHandler;
import cn.com.gzqinghui.wechat.handler.IMsgHandler;
import cn.com.gzqinghui.wechat.handler.TextMsgHandler;
import org.apache.log4j.Logger;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

/**
 * 消息处理转发
 * @author ao.ouyang
 *
 */
public class MsgHandlerForward {
	private final static Logger log = Logger.getLogger(MsgHandlerForward.class);
	static Map<String,IMsgHandler> msghanlderMps = new HashMap<String, IMsgHandler>();
	static{
		msghanlderMps.put("textmsghandler", new TextMsgHandler());
		msghanlderMps.put("eventmsghandler", new EventMsgHandler());
		initMsgHandler();
	}

	static void initMsgHandler(){
		log.info("msgHandler init begin...");
		for (Entry<String, IMsgHandler> msgEntry : msghanlderMps.entrySet()) {
			msgEntry.getValue().init();
		}	
		log.info("msgHandler init end...");
	}
	
	public static IMsgHandler msgForward(InMessage inMessage){
		IMsgHandler msgHandler = null;
		if(inMessage.isText()){
			msgHandler = msghanlderMps.get("textmsghandler");
		}else if(inMessage.isEvent()){
			msgHandler = msghanlderMps.get("eventmsghandler");
		}
		return msgHandler;
	}
	
	
}
