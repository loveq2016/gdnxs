package cn.com.gzqinghui.wechat.common;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

public class HTTPUtil {
    private static final Logger log = LoggerFactory.getLogger(HTTPUtil.class);
    private String charset = "utf-8";
    private static HTTPUtil httpUtil;
    private HttpClient client;
    private String serverUploadUrl;

    private HTTPUtil() {
        BasicHttpParams params = new BasicHttpParams();
        HttpConnectionParams.setConnectionTimeout(params, 30000);
        HttpConnectionParams.setSoTimeout(params, '鱀');
        this.client = new DefaultHttpClient(params);
        this.serverUploadUrl = ConfKit.get("serverUploadUrl");
    }

    public static synchronized HTTPUtil getInstance() {
        if(httpUtil == null) {
            try {
                httpUtil = new HTTPUtil();
            } catch (Exception var1) {
                log.error(var1.getMessage(), var1);
            }
        }

        return httpUtil;
    }

    public String doGetReq(String url) {
        log.info("发起接口请求：{}", url);
        String result = null;
        HttpGet httpGet = new HttpGet(url);
        client = getThreadSafeClient();
        try {
            HttpResponse e = this.client.execute(httpGet);
            if(e.getStatusLine().getStatusCode() == 200) {
                result = EntityUtils.toString(e.getEntity(), "utf-8");
            }
        } catch (Exception var8) {
            log.error(var8.getMessage(), var8);
            result = null;
        } finally {
            httpGet.releaseConnection();
        }

        log.info("接口请求处理完毕。");
        return result;
    }

    public String doPostReq(String url, Map params) {
        String result = null;
        HttpPost httpPost = new HttpPost(url);
        client = getThreadSafeClient();
        try {
            ArrayList e = new ArrayList();
            Iterator var7 = params.entrySet().iterator();

            while(var7.hasNext()) {
                Entry response = (Entry)var7.next();
                e.add(new BasicNameValuePair((String)response.getKey(), response.getValue().toString()));
            }

            httpPost.setEntity(new UrlEncodedFormEntity(e));
            HttpResponse response1 = this.client.execute(httpPost);
            if(response1.getStatusLine().getStatusCode() == 200) {
                result = EntityUtils.toString(response1.getEntity(), "utf-8");
            }
        } catch (Exception var11) {
            log.error(var11.getMessage(), var11);
            result = null;
        } finally {
            httpPost.releaseConnection();
        }

        return result;
    }

    public String doPostReqBody(String url, String bodyStr) {
        log.info("发起接口请求：{}，请求体：{}", url, bodyStr);
        String result = null;
        HttpPost httpPost = new HttpPost(url);
        client = getThreadSafeClient();
        try {
            if(bodyStr != null) {
                httpPost.setEntity(new StringEntity(bodyStr, "UTF-8"));
            }

            HttpResponse e = this.client.execute(httpPost);
            if(e.getStatusLine().getStatusCode() == 200) {
                result = EntityUtils.toString(e.getEntity(), "utf-8");
            }
        } catch (Exception var9) {
            log.error(var9.getMessage(), var9);
            result = null;
        } finally {
            httpPost.releaseConnection();
        }

        log.info("接口请求处理完毕。");
        return result;
    }

    public String doPostReqBodyXML(String url, String bodyStr) {
        String result = null;
        HttpPost httpPost = new HttpPost(url);
        client = getThreadSafeClient();
        try {
            StringEntity e = new StringEntity(bodyStr);
            httpPost.setEntity(e);
            httpPost.setHeader("Content-Type", "text/xml;charset=UTF-8");
            HttpResponse response = this.client.execute(httpPost);
            if(response.getStatusLine().getStatusCode() == 200) {
                result = EntityUtils.toString(response.getEntity(), "utf-8");
            }
        } catch (Exception var10) {
            log.error(var10.getMessage(), var10);
            result = null;
        } finally {
            httpPost.releaseConnection();
        }

        return result;
    }


    public static DefaultHttpClient getThreadSafeClient()  {

        DefaultHttpClient client = new DefaultHttpClient();
        ClientConnectionManager mgr = client.getConnectionManager();
        HttpParams params = client.getParams();
        client = new DefaultHttpClient(new ThreadSafeClientConnManager(params,

                mgr.getSchemeRegistry()), params);
        return client;
    }


}
