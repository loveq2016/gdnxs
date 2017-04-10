package cn.com.gzqinghui.mob.usercenter.usermain.service;

import cn.com.gzqinghui.sysmgr.common.service.IPersistentOperation;

import java.util.Map;

/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: x
* date: 2017-04-05 09:09:18
*/
public interface IUsermainService extends IPersistentOperation {

    Map userBind(String name,String birthday) throws Exception;


}
