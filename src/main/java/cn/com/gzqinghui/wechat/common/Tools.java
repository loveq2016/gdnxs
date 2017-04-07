package cn.com.gzqinghui.wechat.common;

import cn.com.gzqinghui.wechat.bean.InMessage;
import cn.com.gzqinghui.wechat.bean.OutMessage;
import com.qinghui.base.util.AssertUtil;
import com.thoughtworks.xstream.XStream;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

public final class Tools {
	private final static Logger logger = Logger.getLogger(Tools.class);
    public static final String inputStream2String(InputStream in) throws UnsupportedEncodingException, IOException{
        if(in == null)
            return "";

        StringBuilder out = new StringBuilder();
        byte[] b = new byte[4096];
        for (int n; (n = in.read(b)) != -1;) {
            out.append(new String(b, 0, n, "UTF-8"));
        }
        return out.toString();
    }

    public static final boolean checkSignature(String token,String signature,String timestamp,String nonce){
        List<String> params = new ArrayList<String>();
        params.add(token);
        params.add(timestamp);
        params.add(nonce);
        Collections.sort(params, new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                return o1.compareTo(o2);
            }
        });
        String temp = params.get(0)+params.get(1)+params.get(2);
        return DigestUtils.shaHex(temp).equals(signature);
    }

    /**
     *消息体转换
     * @param responseInputString
     * @return
     */
    public static InMessage parsingInMessage(String responseInputString) {
        //转换微信post过来的xml内容
        XStream xs = XStreamFactory.init(false);
        xs.ignoreUnknownElements();
        xs.alias("xml", InMessage.class);
        InMessage msg = (InMessage) xs.fromXML(XStreamFactory.replaceCDATA(responseInputString));
        return msg;
    }


	public static String preWeChatURL(String URL,Object[] params){
		for(int i=0;i<params.length;i++){
			URL=URL.replace("{"+i+"}", params[i].toString());
		}
		return URL;
	}

	 /**
     * 设置发送消息体
     * @param oms
     * @param msg
     * @throws Exception
     */
    public static void setMsgInfo(OutMessage oms,InMessage msg) throws Exception {
    	if(oms != null){
    		Class<?> outMsg = oms.getClass().getSuperclass();
            Field CreateTime = outMsg.getDeclaredField("CreateTime");
            Field ToUserName = outMsg.getDeclaredField("ToUserName");
            Field FromUserName = outMsg.getDeclaredField("FromUserName");

            ToUserName.setAccessible(true);
            CreateTime.setAccessible(true);
            FromUserName.setAccessible(true);

            CreateTime.set(oms, new Date().getTime());
            ToUserName.set(oms, msg.getFromUserName());
            FromUserName.set(oms, msg.getToUserName());
    	}
    }

    /**
     * 生成微信JS 权限认证
     * @return
     * @throws Exception
     */
    public static String genWXJSSignature(String url) throws Exception{
        String signature = "";
        try {
            String accessToken = ToWeChatUtil.getAccessToken().getAccessToken();
            String ticket = ToWeChatUtil.getWXJSApi(accessToken).getTicket();
            String noncestr=ConfKit.get("WX_JS_NONCESTR");
            String timestamp=ConfKit.get("WX_JS_TIMESTAMP");
            String string1="jsapi_ticket="+ticket+"&noncestr="+noncestr+"&timestamp="+timestamp+"&url="+url;
            signature = genSHA1(string1);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }

        return signature;
    }


    /**
     * 生成微信支付签名
     * @return
     * @throws Exception
     * @param
     */
    public static String genWXPaySign(Map<String, String> params)throws Exception{
        if (AssertUtil.isEmpty(params)) {
            return "";
        }
        Set<String> keySet = params.keySet();
        String[] keys = new String[keySet.size()];
        keySet.toArray(keys);
        Arrays.sort(keys);
        String signature = "";
        try {
            StringBuilder sb = new StringBuilder();
            for (String key : keys) {
                sb.append(key).append("=").append(params.get(key)).append("&");
            }
            sb.append("key=").append(ConfKit.get("mchKey"));
            signature = new MD5().getMD5ofStr(sb.toString()).toUpperCase();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return signature;
    }
    /**
     * 生成字符串SHA1密文
     * @param str
     * @return
     * @throws NoSuchAlgorithmException
     */
    public static String genSHA1(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        // SHA1签名生成
        MessageDigest md = MessageDigest.getInstance("SHA-1");
        md.update(str.getBytes("UTF-8"));
        byte[] digest = md.digest();

        StringBuffer hexstr = new StringBuffer();
        String shaHex = "";
        for (int i = 0; i < digest.length; i++) {
            shaHex = Integer.toHexString(digest[i] & 0xFF);
            if (shaHex.length() < 2) {
                hexstr.append(0);
            }
            hexstr.append(shaHex);
        }
        return hexstr.toString();
    }

    /**
     * 生成MD5加密
     * @param strs
     * @return
     * @throws Exception
     */
    public static String genMD5(String strs)throws  Exception{
        char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f' };
        try {
            byte[] strTemp = strs.getBytes();
            MessageDigest mdTemp = MessageDigest.getInstance("MD5");
            mdTemp.update(strTemp);
            byte[] md = mdTemp.digest();
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            return null;
        }
    }


}


