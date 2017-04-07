package cn.com.gzqinghui.wechat.common;

import cn.com.gzqinghui.sysmgr.core.AppContext;
import com.dexcoder.dal.JdbcDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 认证微信权限工具
 * @author ao.ouyang
 *
 */
public class WeChatAuthUtil {
	private final static transient Logger logger = LoggerFactory.getLogger(WeChatAuthUtil.class);
	private static final ThreadLocal<Integer> executeCount = new ThreadLocal() {
		protected Integer initialValue() {
			return Integer.valueOf(5);
		}
	};
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
	 *//*
	private Map getUserInfo(){
		HashMap retMap = new HashMap();
		*//*if(null != RequestContextHolder.requestThreadLocal.get().getSession().getAttribute("_user")){
			Map userinfo = (Map) RequestContextHolder.requestThreadLocal.get().getSession().getAttribute("_user");
			return userinfo;
		}*//*
		try {
			Map wxuserinfo = getWXuserinfo();
			if(null == wxuserinfo){
				retMap.put("code","1");
				retMap.put("msg","获取微信用户失败");
				return retMap;
			}
			*//*Map wxuserinfo = new HashMap();
			wxuserinfo.put("openid","13123123123");
			wxuserinfo.put("nickname","sb");*//*
			retMap = (HashMap) getUserInfo(wxuserinfo);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			retMap.put("code","1");
			retMap.put("msg", e.getMessage());
		}
		return retMap;
	}

	public  Map getWXuserinfo() throws Exception{
		Map wxuserinfo = new HashMap();
		*//*wxuserinfo.put("openid","xxxxxxxxxxx");
		RequestContextHolder.requestThreadLocal.get().getSession().setAttribute("_wxuserinfo", wxuserinfo);
		return wxuserinfo;*//*
		if(null !=RequestContextHolder.requestThreadLocal.get().getSession().getAttribute("_wxuserinfo")){
			wxuserinfo = (Map) RequestContextHolder.requestThreadLocal.get().getSession().getAttribute("_wxuserinfo");
			if(wxuserinfo.get("nickname").toString().contains("\\xF0")){
				wxuserinfo.put("nickname","无法识别");
			}
			wxuserinfo = (Map) RequestContextHolder.requestThreadLocal.get().getSession().getAttribute("_wxuserinfo");
		}else{
			String code = RequestContextHolder.requestThreadLocal.get().getParameter("code");
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
			commonResult = ToWeChatUtil.getWebUserInfoByUnion(ToWeChatUtil.getAccessToken().getAccessToken(), accessToken.get("openid").toString());
			if(commonResult.getCode()!=0){
				throw new Exception(commonResult.getDesc());
			}
			Map unionUserinfo = commonResult.getData();
			wxuserinfo.put("subscribe", unionUserinfo.get("subscribe"));
			if(wxuserinfo.get("nickname").toString().contains("\\xF0")){
				wxuserinfo.put("nickname","无法识别");
			}
			RequestContextHolder.requestThreadLocal.get().getSession().setAttribute("_wxuserinfo", wxuserinfo);
		}
		return wxuserinfo;
	}

	private  Object getUserInfo( Map userinfo) throws Exception, DataConfictException {
		HashMap retMap = new HashMap();
		retMap.put("code","0");
		Connection conn = ds.getConnection();
		QuickDAC dac = null;
		try {
			dac = new QuickDAC(conn);
			dac.preparedSql("select * from vw_Sys_ALLUserRec where OPENID = :openid");
			dac.setPreValue("openid",userinfo.get("openid"));
			List persons = dac.getList();
			if (persons.size() > 0) {
				Map person = (Map) persons.get(0);
				if(person.get("User_Type").toString().equals("0")){
					PorTalUserVO porTalUserVO = poruserDAO.searchPorTalUserByOpenid(person.get("OPENID").toString());
					RequestContextHolder.requestThreadLocal.get().getSession().setAttribute("_user", porTalUserVO);
					RequestContextHolder.requestThreadLocal.get().getSession().setAttribute("username",porTalUserVO.getNickName());
					RequestContextHolder.requestThreadLocal.get().getSession().setAttribute("type", 1);
				}else if(person.get("User_Type").toString().equals("-1")){
					UserVO userVO = poruserDAO.searchUserByMobile(person.get("CONCAT_MOBILE").toString()).get(0);
					RequestContextHolder.requestThreadLocal.get().getSession().setAttribute("_user", userVO);
					RequestContextHolder.requestThreadLocal.get().getSession().setAttribute("username",userVO.getPersonName());
					RequestContextHolder.requestThreadLocal.get().getSession().setAttribute("type", 0);
				}
				RequestContextHolder.requestThreadLocal.get().getSession().setAttribute("_user2", person);
			}else{
				dac.preparedSql("{call USP_OTHER_REGISTER('12345678910','"+ SpringMD5Utils.md5("123456")+"','"+userinfo.get("nickname")+"',4,'','"+userinfo.get("openid")+"')}");
				if(dac.executeCount()>0){
					PorTalUserVO porTalUserVO = poruserDAO.searchPorTalUserByOpenid(userinfo.get("openid").toString());
					RequestContextHolder.requestThreadLocal.get().getSession().setAttribute("_user", porTalUserVO);
					RequestContextHolder.requestThreadLocal.get().getSession().setAttribute("username", porTalUserVO.getNickName());
					RequestContextHolder.requestThreadLocal.get().getSession().setAttribute("type", 1);
					RequestContextHolder.requestThreadLocal.get().getSession().setAttribute("_user2", poruserDAO.searchAllUserById(porTalUserVO.getPortalUserId()));
				}else{
					retMap.put("code","1");
					retMap.put("msg","插入用户失败");
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			retMap.put("code","1");
			retMap.put("msg", e.getMessage());
		} finally {
			if (null != dac)
				dac.destoryWithoutConnection();
			if (null != conn)
				conn.close();
		}
		return retMap;
	}*/

}
