package cn.com.gzqinghui.sysextmgr.extconfig.service.impl;

import cn.com.gzqinghui.sysextmgr.extconfig.service.ISysConfigService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import cn.com.gzqinghui.sysmgr.common.service.impl.PersistentOperationImpl;
import java.util.Map;

/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: kitom
* date: 2017-03-16 22:38:19
*/
@Service("sysConfigService")
public class SysConfigServiceImpl extends PersistentOperationImpl implements ISysConfigService {

    private final static transient Logger logger = LoggerFactory.getLogger(SysConfigServiceImpl.class);

    public String createPageSqlForRowMapList(Map<String, Object> params) throws Exception {
            throw new Exception("请用params实现queryRowMapListByPage的sql拼装,完成分页查询");
    }

}
