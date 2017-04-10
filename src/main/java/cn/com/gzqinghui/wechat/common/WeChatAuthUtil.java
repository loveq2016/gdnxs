package cn.com.gzqinghui.wechat.common;

import cn.com.gzqinghui.sysmgr.core.AppContext;
import com.dexcoder.dal.JdbcDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 认证微信权限工具
 * @author ao.ouyang
 *
 */
public class WeChatAuthUtil {
	private final static transient Logger logger = LoggerFactory.getLogger(WeChatAuthUtil.class);
	private static final Lock lock = new ReentrantLock(true);
	private static WeChatAuthUtil weChatAuthUtil;
	private JdbcDao jdbcDao;

	private WeChatAuthUtil() {
		jdbcDao =  (JdbcDao) AppContext.getSpringContext().getBean("jdbcDao");
	}

	public static WeChatAuthUtil getInstance() {
		if(weChatAuthUtil == null) {
			lock.lock();

			try {
				weChatAuthUtil = new WeChatAuthUtil();
			} finally {
				lock.unlock();
			}
		}

		return weChatAuthUtil;
	}


	/**
	 * 获取用户信息
	 * @param
	 * @return
	 */
	public Map getUserInfo(){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		HashMap retMap = new HashMap();
		retMap.put("code","0");
		try {
			Map wxuserinfo = getWXuserinfo();
			if(null == wxuserinfo){
				retMap.put("code","1");
				retMap.put("msg","获取微信用户失败");
				return retMap;
			}
			retMap.put("wxuserinfo",wxuserinfo);
			Map sysuserinfo = getUserInfo(wxuserinfo);
			if(null != sysuserinfo){
				retMap.put("sysuserinfo",sysuserinfo);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			retMap.put("code","1");
			retMap.put("msg", e.getMessage());
		}
		return retMap;
	}



	private   Map getWXuserinfo() throws Exception{
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		Map wxuserinfo = new HashMap();
		wxuserinfo.put("openid","oy123456");
		wxuserinfo.put("nickname","oy");
		wxuserinfo.put("subscribe","0");
		request.getSession().setAttribute("_userinfo", wxuserinfo);
		return wxuserinfo;
		/*if(null !=request.getSession().getAttribute("_wxuserinfo")){
			wxuserinfo = (Map) request.getSession().getAttribute("_wxuserinfo");
			if(wxuserinfo.get("nickname").toString().contains("\\xF0")){
				wxuserinfo.put("nickname","无法识别");
			}
			wxuserinfo = (Map) request.getSession().getAttribute("_wxuserinfo");
		}else{
			String code = request.getParameter("code");
			System.out.println(code);
			if(null == code){
				return null;
			}
			Map accessToken = ToWeChatUtil.getWebAccessToken(code).getData();
			WeChatCommonResult commonResult = ToWeChatUtil.getWeChatUserInfo(accessToken.get("access_token").toString(), accessToken.get("openid").toString());
			if(commonResult.getCode()!=0){
				throw new Exception(commonResult.getDesc());
			}
			wxuserinfo = commonResult.getData();
			commonResult = ToWeChatUtil.getUserInfoHasUnion(ToWeChatUtil.getAccessToken().getAccessToken(), accessToken.get("openid").toString());
			if(commonResult.getCode()!=0){
				throw new Exception(commonResult.getDesc());
			}
			Map unionUserinfo = commonResult.getData();
			wxuserinfo.put("subscribe", unionUserinfo.get("subscribe"));//subscribe 0未关注  1 已关注
			if(wxuserinfo.get("nickname").toString().contains("\\xF0")){
				wxuserinfo.put("nickname","无法识别");
			}
			request.getSession().setAttribute("_wxuserinfo", wxuserinfo);
		}
		return wxuserinfo;*/
	}


	private  Map getUserInfo( Map userinfo) throws Exception {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		Map sysuserinfo = new HashMap();
		if(null !=request.getSession().getAttribute("_sysuserinfo")){
			sysuserinfo = (Map) request.getSession().getAttribute("_sysuserinfo");
		}else{
			StringBuilder sql = new StringBuilder("select * from tb_member_info where OPENID = '" + userinfo.get("openid") + "' ");
			List members = jdbcDao.queryListForSql(sql.toString());
			if (members.size() > 0) {
				sysuserinfo = (Map) members.get(0);
				request.getSession().setAttribute("_sysuserinfo", sysuserinfo);
			} else {
				sysuserinfo = null;
			}
		}
		return sysuserinfo;
	}



}
