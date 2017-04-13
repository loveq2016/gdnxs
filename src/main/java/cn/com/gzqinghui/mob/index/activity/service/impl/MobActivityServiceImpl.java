package cn.com.gzqinghui.mob.index.activity.service.impl;

import cn.com.gzqinghui.acitivtymgr.activity.service.impl.ActivityServiceImpl;
import cn.com.gzqinghui.acitivtymgr.activity.vo.MembervoterecVO;
import cn.com.gzqinghui.mob.index.activity.service.IMobActivityService;
import cn.com.gzqinghui.sysmgr.common.service.impl.PersistentOperationImpl;
import cn.com.gzqinghui.sysmgr.common.util.ValidateUtil;
import cn.com.gzqinghui.wechat.common.RequestUtil;
import com.dexcoder.dal.JdbcDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: x
* date: 2017-04-05 09:09:18
*/
@Service("mobActivityService")
public class MobActivityServiceImpl extends PersistentOperationImpl implements IMobActivityService{

    @Autowired
    protected JdbcDao jdbcDao;

    private final static transient Logger logger = LoggerFactory.getLogger(ActivityServiceImpl.class);


    @Override
    public List searchActivityHomeCarousel() throws Exception {
        StringBuilder sql =  new StringBuilder(" select * from tb_activity_info WHERE DELETEDFLAG = 0 and ASTATUS = '0' and IS_PUSH_HOMEPAGE = 0 ");
        return jdbcDao.queryListForSql(sql.toString());
    }

    @Override
    public List searchActivityHome() throws Exception {
        StringBuilder sql =  new StringBuilder(" select a.*,(select count(1) from tb_act_member_ref b where b.ACT_ID = a.ID) as ACTMEMBER_COUNT from tb_activity_info a  where 1=1 ");
        sql.append(" and DELETEDFLAG =0 and a.ASTATUS = '0'");
        return jdbcDao.queryListForSql(sql.toString());
    }

    @Override
    public List searchActivityHomeHistory(String kw) throws Exception {
        StringBuilder sql =  new StringBuilder(" select a.*,(select count(1) from tb_act_member_ref b where b.ACT_ID = a.ID) as ACTMEMBER_COUNT from tb_activity_info a  where 1=1 ");
        sql.append(" and DELETEDFLAG =0 and a.ASTATUS = '1'");
        if(!ValidateUtil.isNullOrBlank(kw)){
            sql.append(" and TITLE like '%"+kw+"%'");
        }
        return jdbcDao.queryListForSql(sql.toString());
    }

    @Override
    public Object searchActivityDetail(String id) throws Exception {
        StringBuilder sql =  new StringBuilder(" select a.*,(select count(1) from tb_act_member_ref b where b.ACT_ID = a.ID) as ACTMEMBER_COUNT from tb_activity_info a  where 1=1 ");
        sql.append(" and a.id= '"+id+"' ");
        return jdbcDao.queryListForSql(sql.toString()).get(0);
    }

    @Override
    public List searchActivityDetailPhotoList(String id) throws Exception {
        StringBuilder sql =  new StringBuilder(" select * from tb_activity_pics where DELETEDFLAG = 0 and ACT_ID = '"+id+"' ");
        return jdbcDao.queryListForSql(sql.toString());
    }

    @Override
    public List searchActivityDetailMemberList(String id) throws Exception {
        StringBuilder sql =  new StringBuilder(" select b.*,a.ACT_ID,a.VOTENUM,a.`NO`  from tb_act_member_ref a \n" +
                "INNER JOIN tb_member_info b on a.MEMBER_ID = b.ID where a.ACT_ID = '"+id+"' order by a.`NO` ");
        return jdbcDao.queryListForSql(sql.toString());
    }

    @Override
    public Object searchActivityMemberDetail(String id,String actid) throws Exception {
        StringBuilder sql =  new StringBuilder(" select b.*,a.ACT_ID,a.VOTENUM,a.`NO`  from tb_act_member_ref a \n" +
                "INNER JOIN tb_member_info b on a.MEMBER_ID = b.ID where a.ACT_ID = '"+actid+"' and b.id='"+id+"' ");
        return jdbcDao.queryListForSql(sql.toString()).get(0);
    }

    @Override
    public List searchActivityTopList(String id) throws Exception {
        StringBuilder sql =  new StringBuilder(" select b.*,a.ACT_ID,a.VOTENUM,a.`NO`  from tb_act_member_ref a \n" +
                "INNER JOIN tb_member_info b on a.MEMBER_ID = b.ID where a.ACT_ID = '"+id+"' ORDER BY a.VOTENUM desc ");
        return jdbcDao.queryListForSql(sql.toString());
    }

    @Override
    public void actVote(String id, String actid) throws Exception {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Map userinfo =  (Map)request.getSession().getAttribute("_userinfo");
        Integer rec = ((Long) jdbcDao.queryListForSql("select count(1) as rec from tb_membervoterec  where OPENID= '" + userinfo.get("openid") + "' and ACT_ID='" + actid + "' and  MENBER='" + id + "' ").get(0).get("rec")).intValue();
        if(rec>0){
            throw new  Exception ("您已经投过票了");
        }
        MembervoterecVO membervoterecVO  = new MembervoterecVO();
        membervoterecVO.setId(UUID.randomUUID().toString());
        membervoterecVO.setActId(actid);
        membervoterecVO.setMenber(id);
        membervoterecVO.setOpenid((String) userinfo.get("openid"));
        membervoterecVO.setName((String) userinfo.get("nickname"));
        membervoterecVO.setIp(RequestUtil.getRemoteHost(request));
        jdbcDao.save(membervoterecVO);
        jdbcDao.updateForSql(" update tb_act_member_ref set VOTENUM = VOTENUM+1 where ACT_ID='"+actid+"' and MEMBER_ID = '"+id+"' ");

    }

    @Override
    public Map searchActMember(String id, String kw) throws Exception {
        StringBuilder sql =  new StringBuilder(" select b.*,a.ACT_ID,a.VOTENUM,a.`NO`  from tb_act_member_ref a \n" +
                "INNER JOIN tb_member_info b on a.MEMBER_ID = b.ID where a.ACT_ID = '"+id+"' and (a.no ='"+kw+"' or b.name like '%"+kw+"%')  ");
        List members =  jdbcDao.queryListForSql(sql.toString());
        if(members.size()>0){
            return (Map) members.get(0);
        }else{
            return null;
        }
    }
}
