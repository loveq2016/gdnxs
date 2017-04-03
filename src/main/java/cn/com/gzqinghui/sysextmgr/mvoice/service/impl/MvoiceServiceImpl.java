package cn.com.gzqinghui.sysextmgr.mvoice.service.impl;

import cn.com.gzqinghui.sysextmgr.mvoice.service.IMvoiceService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import cn.com.gzqinghui.sysmgr.common.service.impl.PersistentOperationImpl;
import java.util.Map;

/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: kki
* date: 2017-03-24 13:36:19
*/
@Service("mvoiceService")
public class MvoiceServiceImpl extends PersistentOperationImpl implements IMvoiceService {

    private final static transient Logger logger = LoggerFactory.getLogger(MvoiceServiceImpl.class);

    public String createPageSqlForRowMapList(Map<String, Object> params) throws Exception {
            throw new Exception("请用params实现queryRowMapListByPage的sql拼装,完成分页查询");
    }

}
