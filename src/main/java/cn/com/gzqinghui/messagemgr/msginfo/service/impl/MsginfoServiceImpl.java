package cn.com.gzqinghui.messagemgr.msginfo.service.impl;

import cn.com.gzqinghui.messagemgr.msginfo.service.IMsginfoService;
import cn.com.gzqinghui.sysmgr.common.service.impl.PersistentOperationImpl;
import cn.com.gzqinghui.sysmgr.common.util.ValidateUtil;
import com.dexcoder.commons.pager.AcePageBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: x
* date: 2017-04-06 11:41:19
*/
@Service("msginfoService")
public class MsginfoServiceImpl extends PersistentOperationImpl implements IMsginfoService {

    private final static transient Logger logger = LoggerFactory.getLogger(MsginfoServiceImpl.class);

    public String createPageSqlForRowMapList(Map<String, Object> params) throws Exception {
            throw new Exception("请用params实现queryRowMapListByPage的sql拼装,完成分页查询");
    }

    @Override
    public Map<String, Object> queryMsgInfoMapListByPage(AcePageBean pageBean) throws Exception {
        Map params = pageBean.getQueryParams();
        StringBuilder sql  = new StringBuilder("select a.*,b.NAME,b.CONCAT_PHONE  from tb_msg_info a\n" +
                "INNER JOIN tb_member_info b on a.MEMBER_ID = b.ID  where 1=1 ");
        if(!ValidateUtil.isNullOrBlank(params.get("name"))){
            sql.append(" and b.NAME LIKE '%"+params.get("name")+"%' ");
        }
        if(!ValidateUtil.isNullOrBlank(params.get("phone"))){
            sql.append(" and b.CONCAT_PHONE LIKE '%"+params.get("phone")+"%' ");
        }
        if(!ValidateUtil.isNullOrBlank(params.get("title"))){
            sql.append(" and a.title LIKE '%"+params.get("title")+"%' ");
        }
        return this.jdbcDao.queryRowMapList(sql.toString(), pageBean.getLimit(), pageBean.getOffset(), pageBean.getSort(), pageBean.getOrder());
    }
}
