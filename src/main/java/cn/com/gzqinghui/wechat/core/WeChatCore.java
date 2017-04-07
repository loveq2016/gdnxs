package cn.com.gzqinghui.wechat.core;

import cn.com.gzqinghui.wechat.bean.InMessage;
import cn.com.gzqinghui.wechat.common.Tools;
import cn.com.gzqinghui.wechat.handler.IMsgHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class WeChatCore {
    private static final Logger logger = LoggerFactory.getLogger(WeChatCore.class);


	 /**
     * 根据接收到用户消息进行处理
     * @param responseInputString   微信发送过来的xml消息体
     * @return
     */
    public static String processing(String responseInputString) {
        InMessage inMessage = Tools.parsingInMessage(responseInputString);
        String xml = "";
        try {
        	IMsgHandler msgHandler = MsgHandlerForward.msgForward(inMessage);
        	msgHandler.beforeExec(inMessage);
        	msgHandler.exec(inMessage);
        	msgHandler.afterExec(inMessage);
        	xml = msgHandler.doOutStr();
        } catch (Exception e) {
        	logger.error(e.getMessage());
        	throw new RuntimeException(e);
        }
        return xml;
    }




}
