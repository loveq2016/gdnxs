package cn.com.gzqinghui.wechat.basic;

public class WeChatReqsUTLCfg {

	public final static String WECHAT_TOKEN = "gdnxstechc1x2xx3xb4xb6";
	
	public static final String ACCESSTOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential";
	
	public static final String MENU_CREATE_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=";
	
	public static final String MENU_GET_URL = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=";
	
	public static final String MENU_DELETE_URL = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=";
	
	public static final String WEB_ACCESS_TOKEN = "https://api.weixin.qq.com/sns/oauth2/access_token?appid={0}&secret={1}&code={2}&grant_type=authorization_code";
	
	/**
	 * 获取授权用户信息 code URL
	 */
	public static final String WEB_AUTH_USER_INFO = "https://open.weixin.qq.com/connect/oauth2/authorize?appid={0}&redirect_uri={1}&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
	
	/**
	 * 获取微信用户信息
	 */
	public static final String GET_USER_INFO="https://api.weixin.qq.com/sns/userinfo?access_token={0}&openid={1}&lang=zh_CN";

	/**
	 *
	 */
	public static final String GET_USER_INFO_APP="https://api.weixin.qq.com/cgi-bin/user/info?access_token={0}&openid={1}&lang=zh_CN";

	/**
	 * 微信JS SDK签名校验权限
	 */
	public static final String WX_JS_API_URL="https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token={0}&type=jsapi";

	/**
	 * 微信支付统一下单
	 */
	public static final String WX_PAY_UNIFIEDORDER="https://api.mch.weixin.qq.com/pay/unifiedorder";

	public static final String WX_GET_USER_UNIONID="https://api.weixin.qq.com/cgi-bin/user/info?access_token={0}&openid={1}&lang=zh_CN";


}
