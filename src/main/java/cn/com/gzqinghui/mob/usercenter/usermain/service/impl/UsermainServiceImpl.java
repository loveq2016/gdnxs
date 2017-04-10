package cn.com.gzqinghui.mob.usercenter.usermain.service.impl;

import cn.com.gzqinghui.acitivtymgr.member.vo.MemberVO;
import cn.com.gzqinghui.mob.usercenter.usermain.service.IUsermainService;
import cn.com.gzqinghui.sysmgr.common.service.impl.PersistentOperationImpl;
import com.dexcoder.dal.JdbcDao;
import com.wechat.util.HttpDownload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: x
* date: 2017-04-05 09:09:18
*/
@Service("mobUsermainService")
public class UsermainServiceImpl extends PersistentOperationImpl implements IUsermainService{

    @Autowired
    protected JdbcDao jdbcDao;

    @Override
    public Map userBind(String name, String birthday) throws Exception {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Map userinfo =  (Map)request.getSession().getAttribute("_userinfo");
        Integer rec = ((Long) jdbcDao.queryListForSql("select count(1) as rec from tb_member_info where DELETEDFLAG = 0 and  `NAME` = '"+name+"' and BIRTHDAY = '"+birthday+"' ").get(0).get("rec")).intValue();
        if(rec<=0){
            throw new  Exception ("匹配不到属于您的信息，绑定失败");
        }
        String headimg = "/"+ HttpDownload.httpDownload((String) userinfo.get("headimgurl"), request,"avatar");
        jdbcDao.updateForSql(" update tb_member_info set openid = '" + userinfo.get("openid") + "',AVATAR='" + headimg + "' where DELETEDFLAG = 0 and `NAME` = '" + name + "' and BIRTHDAY = '" + birthday + "' ");
       return jdbcDao.queryListForSql(" select * from tb_member_info  where DELETEDFLAG = 0 and `NAME` = '"+name+"' and BIRTHDAY = '"+birthday+"' ").get(0);
    }

    @Override
    public Map editUserinfo(MemberVO member) throws Exception {
        StringBuffer sql = new StringBuffer("update tb_member_info set  GENDER = '"+member.getGender()+"',city='"+member.getCity()+"',area='"+member.getArea()+"',SPECIALTY='"+member.getSpecialty()+"',SELFDESC='"+member.getSelfdesc()+"' where ID = '"+member.getId()+"' ");
        jdbcDao.updateForSql(sql.toString());
        return  jdbcDao.queryListForSql(" select * from  tb_member_info where id = '"+member.getId()+"' ").get(0);
    }

    @Override
    public Map editUserAvatar(String url) throws Exception {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Map sysuserinfo =  (Map)request.getSession().getAttribute("_sysuserinfo");
        jdbcDao.updateForSql("update tb_member_info set avatar='"+url+"' where id='"+sysuserinfo.get("id")+"' ");
        return  jdbcDao.queryListForSql(" select * from  tb_member_info  where id='"+sysuserinfo.get("id")+"'").get(0);
    }
}
