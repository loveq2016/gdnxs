package cn.com.gzqinghui.wechat.basic;

import java.io.Serializable;
import java.util.Map;

/**
 * Created by ao.ouyang on 2015/9/9.  微信企业号返回结果
 */
public class WeChatCommonResult implements Serializable{

    private Integer code;

    private String desc;

    private Map data;

    private String accessToken; //APP  token

    private String webAccessToken; //web token

    private String ticket; //web  验证 ticket

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Map getData() {
        return data;
    }

    public void setData(Map data) {
        this.data = data;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public String getWebAccessToken() {
        return webAccessToken;
    }

    public void setWebAccessToken(String webAccessToken) {
        this.webAccessToken = webAccessToken;
    }

    public String getTicket() {
        return ticket;
    }

    public void setTicket(String ticket) {
        this.ticket = ticket;
    }
}
