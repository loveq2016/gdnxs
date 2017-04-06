package cn.com.gzqinghui.acitivtymgr.activityquery.service;
import cn.com.gzqinghui.sysmgr.common.service.IPersistentOperation;
import com.dexcoder.commons.pager.AcePageBean;
import org.apache.poi.ss.formula.functions.T;

import java.util.List;
import java.util.Map;

/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: x
* date: 2017-04-05 17:27:30
*/
public interface IactivityqueryService extends IPersistentOperation {

    Map<String, Object> queryActQueryMapListByPage(AcePageBean pageBean) throws Exception;

    List queryActList(AcePageBean pageBean) throws Exception;

}
