package cn.com.gzqinghui.mob.usercenter.usermain.service.impl;

import cn.com.gzqinghui.mob.usercenter.usermain.service.IUsermainService;
import cn.com.gzqinghui.sysmgr.common.service.impl.PersistentOperationImpl;
import com.dexcoder.dal.JdbcDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
