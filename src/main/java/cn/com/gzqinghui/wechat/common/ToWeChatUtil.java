package cn.com.gzqinghui.wechat.common;

import cn.com.gzqinghui.wechat.basic.WeChatCommonResult;
import cn.com.gzqinghui.wechat.basic.WeChatReqsUTLCfg;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.qinghui.base.util.EhcacheUtil;
import com.qinghui.base.util.ValidateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;
import java.util.Set;

public class ToWeChatUtil {
    private static final Logger logger = LoggerFactory.getLogger(ToWeChatUtil.class);

	/**
	 * 同步更新微信菜单
	 * @param menuStr
	 * @return 成功信息
	 */
	public static WeChatCommonResult updateWeChatMenu(String menuStr) throws Exception {
         removeWeChatMenu();
         String jsonStr = HTTPUtil.getInstance().doPostReqBody(WeChatReqsUTLCfg.MENU_CREATE_URL+getAccessToken().getAccessToken(),menuStr);
         Map<String, String> map = new Gson().fromJson(jsonStr,new TypeToken<Map<String,String>>() {}.getType());
        return doOutResult(map);

	}

	public static WeChatCommonResult removeWeChatMenu() throws Exception {
        String jsonStr = HTTPUtil.getInstance().doGetReq(WeChatReqsUTLCfg.MENU_DELETE_URL + getAccessToken().getAccessToken());
         Map<String, String> map = new Gson().fromJson(jsonStr,new TypeToken<Map<String,String>>() {}.getType());
        return doOutResult(map);
	}


	 /**
     * 获取access_token
     * @return
     * @throws Exception
     */
    public static WeChatCommonResult getAccessToken() throws Exception {
        String appid = ConfKit.get("AppId");
        String secret = ConfKit.get("AppSecret");
        String jsonStr = HTTPUtil.getInstance().doGetReq(WeChatReqsUTLCfg.ACCESSTOKEN_URL.concat("&appid=") + appid + "&secret=" + secret);
        Map<String, Object> map = new Gson().fromJson(jsonStr, new TypeToken<Map>() {
        }.getType());
        WeChatCommonResult commonResult = doOutResult(map);
        if(0==commonResult.getCode()){
            commonResult.setAccessToken(commonResult.getData().get("access_token").toString());
        }
        return commonResult;
    }

    /**
     * 发起获取网页授权获取用户信息的ACCESS_TOKEN
     * @param code 授权成功的code
     * @return
     * @throws Exception
     */
    public static WeChatCommonResult getWebAccessToken(String code) throws Exception{
    	String appid = ConfKit.get("AppId");
        String secret = ConfKit.get("AppSecret");
       /* String appid = "wx0d6eb8128d68989f";
        String secret = "6f1cb8d9f91c75915d54836add6dcbc1";*/
        String jsonStr = HTTPUtil.getInstance().doGetReq(Tools.preWeChatURL(WeChatReqsUTLCfg.WEB_ACCESS_TOKEN, new Object[]{appid, secret, code}));
        Map<String, Object> map = new Gson().fromJson(jsonStr, new TypeToken<Map>() {
        }.getType());
        WeChatCommonResult commonResult = doOutResult(map);
        if(0==commonResult.getCode()){
            commonResult.setWebAccessToken(commonResult.getData().get("access_token").toString());
        }
        return commonResult;
    }


    /**
     * 获取微信用户信息
     * @param token
     * @param openid
     * @return
     * @throws Exception
     */
    public static WeChatCommonResult getWeChatUserInfo(String token, String openid) throws Exception{
        String jsonStr = HTTPUtil.getInstance().doGetReq(Tools.preWeChatURL(WeChatReqsUTLCfg.GET_USER_INFO, new Object[]{token, openid}));
        Map<String, Object> map = new Gson().fromJson(jsonStr.trim(), new TypeToken<Map>() {
        }.getType());
        return doOutResult(map);
    }

    /**
     * 获取用户数据根据union机制
     * @param token
     * @param openid
     * @return
     * @throws Exception
     */
    public static WeChatCommonResult getUserInfoHasUnion(String token, String openid) throws  Exception{
        String jsonStr = HTTPUtil.getInstance().doGetReq(Tools.preWeChatURL(WeChatReqsUTLCfg.WX_GET_USER_UNIONID, new Object[]{token, openid}));
        Map<String, Object> map = new Gson().fromJson(jsonStr.trim(), new TypeToken<Map>() {
        }.getType());
        WeChatCommonResult commonResult = doOutResult(map);
        return doOutResult(map);
    }

    /**
     * userId查用户信息
     * @param openid
     * @return
     * @throws Exception
     */
    public static WeChatCommonResult getAppUserInfo(String openid) throws Exception{
        String accessToken = getAccessToken().getAccessToken();
        String jsonStr = HTTPUtil.getInstance().doGetReq(Tools.preWeChatURL(WeChatReqsUTLCfg.GET_USER_INFO_APP, new Object[]{accessToken, openid}));
        Map<String, Object> map = new Gson().fromJson(jsonStr, new TypeToken<Map>() {
        }.getType());
        return doOutResult(map);
    }


    /**
     * 获取WX JS API 票据
     * @param accessToken
     * @return
     */
    public static WeChatCommonResult getWXJSApi(String accessToken) throws Exception{
        if(!ValidateUtil.isNullOrBlank(EhcacheUtil.getInstance().get("WE_CHAT_CACHE").get("ticket"))){
            return (WeChatCommonResult)EhcacheUtil.getInstance().get("WE_CHAT_CACHE").get("ticket").getObjectValue();
        }
        String jsonStr = HTTPUtil.getInstance().doGetReq(Tools.preWeChatURL(WeChatReqsUTLCfg.WX_JS_API_URL, new Object[]{accessToken}));
        Map<String, Object> map = new Gson().fromJson(jsonStr, new TypeToken<Map>() {
        }.getType());
        WeChatCommonResult commonResult = doOutResult(map);
        if(0==commonResult.getCode()){
            commonResult.setTicket(commonResult.getData().get("ticket").toString());
        }
        if(!ValidateUtil.isNullOrBlank(map.get("ticket"))){EhcacheUtil.getInstance().put("WE_CHAT_CACHE", "ticket", commonResult);}
        return commonResult;
    }

    /**
     * 微信网页支付统一下单
     * @return
     * @throws Exception
     */
    public static Map wechatPayOrder(Map params)throws Exception{
        StringBuilder sb = new StringBuilder();
        sb.append("<xml>");
        for (Map.Entry en : (Set<Map.Entry>)params.entrySet()){
           // if(en.getKey().equals("body")){
          //     sb.append("<"+en.getKey()+"><![CDATA["+ en.getValue()+"]]></"+en.getKey()+">");
          //  }else{
                sb.append("<").append(en.getKey()).append(">").append(en.getValue()).append("</").append(en.getKey()).append(">");
         //   }
        }
        sb.append("<sign>").append(Tools.genWXPaySign(params)).append("</sign>");
        sb.append("</xml>");
        String xmlStr = HTTPUtil.getInstance().doPostReqBodyXML(WeChatReqsUTLCfg.WX_PAY_UNIFIEDORDER, new String(sb.toString().getBytes("UTF-8"), "ISO-8859-1"));
        return XmlUtil.xml2Map(xmlStr);
    }

    /**
     * 设置返回数据
     * @param resultMap
     * @return
     */
    public static WeChatCommonResult doOutResult(Map resultMap){
        WeChatCommonResult commonResult = new WeChatCommonResult();
        if(!ValidateUtil.isNullOrBlank(resultMap.get("errcode"))){
            commonResult.setCode(Float.valueOf(resultMap.get("errcode").toString()).intValue());
            commonResult.setDesc(resultMap.get("errmsg").toString());
        }else{
            commonResult.setCode(0);
        }
        commonResult.setData(resultMap);
        return commonResult;
    }

    public static void  main(String[] args) throws Exception {

        System.out.println(getAppUserInfo("ocf2VwwdlTxUxldzgao969Rj29qQ").getData());
    }


}
