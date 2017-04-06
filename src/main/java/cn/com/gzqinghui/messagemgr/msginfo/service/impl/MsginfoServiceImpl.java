package cn.com.gzqinghui.messagemgr.msginfo.service.impl;

import cn.com.gzqinghui.messagemgr.msginfo.service.IMsginfoService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import cn.com.gzqinghui.sysmgr.common.service.impl.PersistentOperationImpl;
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

}
