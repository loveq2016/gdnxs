package cn.com.gzqinghui.acitivtymgr.activity.service;
import cn.com.gzqinghui.sysmgr.common.service.IPersistentOperation;
import com.dexcoder.commons.bean.IBaseEntity;
import com.dexcoder.commons.pager.AcePageBean;
import org.apache.poi.ss.formula.functions.T;

import java.util.List;
import java.util.Map;

/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: x
* date: 2017-04-05 09:09:18
*/
public interface IActivityService extends IPersistentOperation {

    <T extends IBaseEntity> Map<String, Object> queryListByPageAndWhere(T var1, AcePageBean var2) throws Exception;

    Map<String, Object> queryActMemberImportListRowMapListByPage(AcePageBean pageBean) throws Exception;

    Map<String, Object> queryActMemberRowMapListByPage(AcePageBean pageBean) throws Exception;

    void importActMemeber(String id,String memberids) throws Exception;

    <T extends IBaseEntity> List  queryPhotoList(T t) throws Exception;




}
