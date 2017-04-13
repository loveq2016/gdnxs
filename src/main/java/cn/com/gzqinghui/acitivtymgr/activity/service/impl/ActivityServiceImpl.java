package cn.com.gzqinghui.acitivtymgr.activity.service.impl;

import cn.com.gzqinghui.acitivtymgr.activity.service.IActivityService;
import cn.com.gzqinghui.acitivtymgr.activity.vo.ActMembeRefVO;
import cn.com.gzqinghui.sysmgr.common.service.impl.PersistentOperationImpl;
import cn.com.gzqinghui.sysmgr.common.util.DateUtil;
import cn.com.gzqinghui.sysmgr.common.util.ValidateUtil;
import cn.com.gzqinghui.sysmgr.core.AppContext;
import com.dexcoder.commons.bean.IBaseEntity;
import com.dexcoder.commons.pager.AcePageBean;
import com.dexcoder.dal.JdbcDao;
import com.dexcoder.dal.build.Criteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: x
* date: 2017-04-05 09:09:18
*/
@Service("activityService")
public class ActivityServiceImpl extends PersistentOperationImpl implements IActivityService {

    @Autowired
    protected JdbcDao jdbcDao;

    private final static transient Logger logger = LoggerFactory.getLogger(ActivityServiceImpl.class);

    public String createPageSqlForRowMapList(Map<String, Object> params) throws Exception {

        return "";
    }

    @Override
    public <T extends IBaseEntity> Map<String, Object> queryListByPageAndWhere(T entity, AcePageBean page) throws Exception {
        Criteria criteria = Criteria.select(entity.getClass(), false).and("createdate", ">=",
                new Object[]{"2016-01-01"});

       return jdbcDao.queryListByPage(criteria, entity, page.getLimit(), page.getOffset(), page.getSort(), page.getOrder());
    }

    @Override
    public Map<String, Object> queryActMemberImportListRowMapListByPage(AcePageBean pageBean) throws Exception {
        String id = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getParameter("id");
        Map params = pageBean.getQueryParams();
        StringBuilder sql  = new StringBuilder("select * from tb_member_info where 1=1 and  id  not in (select MEMBER_ID from tb_act_member_ref where ACT_ID='" + id + "' ) ");
        if(!ValidateUtil.isNullOrBlank(params.get("name"))){
            sql.append(" and NAME LIKE '%"+params.get("name")+"%' ");
        }
        if(!ValidateUtil.isNullOrBlank(params.get("phone"))){
            sql.append(" and CONCAT_PHONE LIKE '%"+params.get("phone")+"%' ");
        }
        return this.jdbcDao.queryRowMapList(sql.toString(), pageBean.getLimit(), pageBean.getOffset(), pageBean.getSort(), pageBean.getOrder());
    }

    @Override
    public Map<String, Object> queryActMemberRowMapListByPage(AcePageBean pageBean) throws Exception {
        String id = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getParameter("id");
        Map params = pageBean.getQueryParams();
        StringBuilder sql  = new StringBuilder("select a.ID as refid,a.`NO`,b.* from tb_act_member_ref a\n" +
                "INNER JOIN tb_member_info b on a.MEMBER_ID = b.ID  where 1=1 and a.ACT_ID = '"+id+"'");
        if(!ValidateUtil.isNullOrBlank(params.get("name"))){
            sql.append(" and b.NAME LIKE '%"+params.get("name")+"%' ");
        }
        if(!ValidateUtil.isNullOrBlank(params.get("phone"))){
            sql.append(" and b.CONCAT_PHONE LIKE '%"+params.get("phone")+"%' ");
        }
        return this.jdbcDao.queryRowMapList(sql.toString(), pageBean.getLimit(), pageBean.getOffset(), pageBean.getSort(), pageBean.getOrder());
    }

    @Override
    public void importActMemeber(String id, String memberids) throws Exception {
        Integer maxsql = ((Long)this.jdbcDao.queryListForSql("select IFNULL(max(`NO`),1) as maxseq from tb_act_member_ref where act_id = '" + id + "' ").get(0).get("maxseq")).intValue();
        String[] memberid = memberids.split(",");
        for(String membid : memberid){
            ActMembeRefVO membeRefVO = new ActMembeRefVO();
            membeRefVO.setId(UUID.randomUUID().toString());
            membeRefVO.setCreatedate(DateUtil.formartCurrentDateTime());
            membeRefVO.setCreatorid(AppContext.getCurrentUser().getId());
            membeRefVO.setMemberId(membid);
            membeRefVO.setNo(maxsql++ + "");
            membeRefVO.setActId(id);
            membeRefVO.setVotenum("0");
            jdbcDao.save(membeRefVO);
        }



    }

    @Override
    public <T extends IBaseEntity> List queryPhotoList(T t) throws Exception {
        String id = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getParameter("id");
        Criteria criteria = Criteria.select(t.getClass(), false).and("actId", "=",
                new Object[]{id});
        return jdbcDao.queryList(t,criteria);
    }


}
