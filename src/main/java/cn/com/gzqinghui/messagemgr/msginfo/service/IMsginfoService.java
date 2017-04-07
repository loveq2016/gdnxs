package cn.com.gzqinghui.messagemgr.msginfo.service;
import cn.com.gzqinghui.sysmgr.common.service.IPersistentOperation;
import com.dexcoder.commons.pager.AcePageBean;

import java.util.Map;

/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: x
* date: 2017-04-06 11:41:19
*/
public interface IMsginfoService extends IPersistentOperation {


    Map<String, Object> queryMsgInfoMapListByPage(AcePageBean pageBean) throws Exception;

}
