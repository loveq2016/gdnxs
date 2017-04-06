package cn.com.gzqinghui.acitivtymgr.activityquery.service.impl;

import cn.com.gzqinghui.acitivtymgr.activityquery.service.IactivityqueryService;

import cn.com.gzqinghui.common.util.Base64Encode;
import cn.com.gzqinghui.common.util.ReportUtil;
import com.dexcoder.commons.pager.AcePageBean;
import com.dexcoder.dal.JdbcDao;
import com.qinghui.base.util.EhcacheUtil;
import com.qinghui.base.util.ValidateUtil;
import com.thoughtworks.xstream.core.BaseException;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.com.gzqinghui.sysmgr.common.service.impl.PersistentOperationImpl;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.Map;

/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: x
* date: 2017-04-05 17:27:30
*/
@Service("activityqueryService")
public class activityqueryServiceImpl extends PersistentOperationImpl implements IactivityqueryService {

    @Autowired
    protected JdbcDao jdbcDao;

    private final static transient Logger logger = LoggerFactory.getLogger(activityqueryServiceImpl.class);

    public String createPageSqlForRowMapList(Map<String, Object> params) throws Exception {
            throw new Exception("请用params实现queryRowMapListByPage的sql拼装,完成分页查询");
    }

    @Override
    public Map<String, Object> queryActQueryMapListByPage(AcePageBean pageBean) throws Exception {
        Map params = pageBean.getQueryParams();
        StringBuilder sql  = new StringBuilder("select c.TITLE,a.ID as refid,a.`NO`,a.VOTENUM,a.ACT_ID,b.* from tb_act_member_ref a\n" +
                "INNER JOIN tb_member_info b on a.MEMBER_ID = b.ID\n" +
                "INNER JOIN tb_activity_info c on c.ID = a.ACT_ID  where 1=1 ");
        if(!ValidateUtil.isNullOrBlank(params.get("name"))){
            sql.append(" and b.NAME LIKE '%"+params.get("name")+"%' ");
        }
        if(!ValidateUtil.isNullOrBlank(params.get("phone"))){
            sql.append(" and b.CONCAT_PHONE LIKE '%"+params.get("phone")+"%' ");
        }
        if(!ValidateUtil.isNullOrBlank(params.get("title"))){
            sql.append(" and c.title LIKE '%"+params.get("title")+"%' ");
        }
        return this.jdbcDao.queryRowMapList(sql.toString(), pageBean.getLimit(), pageBean.getOffset(), pageBean.getSort(), pageBean.getOrder());
    }

    @Override
    public List queryActList(AcePageBean pageBean) throws Exception {
        Map params = pageBean.getQueryParams();
        StringBuilder sql  = new StringBuilder("select c.TITLE,a.ID as refid,a.`NO`,a.VOTENUM,a.ACT_ID,b.*,d1.ITEM_CODE_DESC as GENDER_DESC,d2.ITEM_CODE_DESC as AREA_DESC from tb_act_member_ref a\n" +
                "INNER JOIN tb_member_info b on a.MEMBER_ID = b.ID\n" +
                "INNER JOIN tb_activity_info c on c.ID = a.ACT_ID\n" +
                "LEFT JOIN tb_dictionary d1 ON d1.DICT_TYPE = 'personSex' and d1.ITEM_CODE = b.GENDER\n" +
                "LEFT JOIN tb_dictionary d2 ON d2.DICT_TYPE = 'area' and d2.ITEM_CODE = b.AREA\n" +
                "  where 1=1  ");
        if(!ValidateUtil.isNullOrBlank(params.get("name"))){
            sql.append(" and b.NAME LIKE '%"+params.get("name")+"%' ");
        }
        if(!ValidateUtil.isNullOrBlank(params.get("phone"))){
            sql.append(" and b.CONCAT_PHONE LIKE '%"+params.get("phone")+"%' ");
        }
        if(!ValidateUtil.isNullOrBlank(params.get("title"))){
            sql.append(" and c.title LIKE '%"+params.get("title")+"%' ");
        }
        return this.jdbcDao.queryListForSql(sql.toString());
    }



}
