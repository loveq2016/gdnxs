package cn.com.gzqinghui.wechat.handler;


import cn.com.gzqinghui.wechat.bean.InMessage;
import cn.com.gzqinghui.wechat.bean.OutMessage;

/**
 * 消息处理者
 * @author ao.ouyang
 *
 */
public interface IMsgHandler {
	
	void init();
	
	void beforeExec(InMessage inMessage);
	
	void exec(InMessage inMessage) throws Exception;
	
	void afterExec(InMessage inMessage);
	
	OutMessage doOutMessage();
	
	String doOutStr();
}
