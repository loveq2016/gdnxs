package cn.com.gzqinghui.faqinfomgr.faqinfomgr.service.impl;

import cn.com.gzqinghui.faqinfomgr.faqinfomgr.service.IFaqService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import cn.com.gzqinghui.sysmgr.common.service.impl.PersistentOperationImpl;
import java.util.Map;

/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: x
* date: 2017-04-07 09:54:40
*/
@Service("faqService")
public class FaqServiceImpl extends PersistentOperationImpl implements IFaqService {

    private final static transient Logger logger = LoggerFactory.getLogger(FaqServiceImpl.class);

    public String createPageSqlForRowMapList(Map<String, Object> params) throws Exception {
            throw new Exception("请用params实现queryRowMapListByPage的sql拼装,完成分页查询");
    }

}
