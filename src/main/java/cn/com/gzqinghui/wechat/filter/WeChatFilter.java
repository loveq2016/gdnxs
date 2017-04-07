package cn.com.gzqinghui.wechat.filter;

import cn.com.gzqinghui.wechat.basic.WeChatReqsUTLCfg;
import cn.com.gzqinghui.wechat.common.Tools;
import cn.com.gzqinghui.wechat.core.WeChatCore;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 请求拦截
 *
 * @author ao.ouyang
 */
public class WeChatFilter implements Filter {

    private static final Logger log = Logger.getLogger(WeChatFilter.class);

    @Override
    public void destroy() {
    	log.info("WeChatFilter已经销毁");
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        Boolean isGet = request.getMethod().equals("GET");

        if (isGet) {
            doGet(request, response);
        } else {
            doPost(request, response);
        }
    }

    private void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/xml");
        ServletInputStream in = request.getInputStream();
        String xmlMsg = Tools.inputStream2String(in);
        log.debug("输入消息:[" + xmlMsg + "]");
        String xml = WeChatCore.processing(xmlMsg);
        log.debug("输出消息:[" + xml + "]");
        response.getWriter().write(xml==null?"":xml);
        response.getWriter().flush();
    }

    private void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String path = request.getServletPath();
        String pathInfo = path.substring(path.lastIndexOf("/"));
        String outPut = "error";
        if (!pathInfo.isEmpty()) {
            String signature = request.getParameter("signature");// 微信加密签名
            String timestamp = request.getParameter("timestamp");// 时间戳
            String nonce = request.getParameter("nonce");// 随机数
            String echostr = request.getParameter("echostr");//
            // 验证
            if (Tools.checkSignature(WeChatReqsUTLCfg.WECHAT_TOKEN, signature, timestamp, nonce)) {
                outPut = echostr;
            }
        }
        response.getWriter().write(outPut);
        response.getWriter().flush();
    }

    @Override
    public void init(FilterConfig config) throws ServletException {
    	log.info("WeChatFilter已经启动！");
    }

}
