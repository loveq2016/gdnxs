package cn.com.gzqinghui.wechat.basic;

/**
 * 消息类型
 * @author ao.ouyang
 */
public enum MsgTypes {
	TEXT(), 
	LOCATION(), 
	IMAGE(),
	LINK(),
	VOICE(),
	EVENT(),
	VIDEO(),
	NEWS(),
	MUSIC(),
	VERIFY();
	
	public String getType() {
		return this.name().toLowerCase();
	}
}
