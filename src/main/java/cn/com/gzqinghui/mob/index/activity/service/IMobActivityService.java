package cn.com.gzqinghui.mob.index.activity.service;

import cn.com.gzqinghui.sysmgr.common.service.IPersistentOperation;

import java.util.List;
import java.util.Map;

/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: x
* date: 2017-04-05 09:09:18
*/
public interface IMobActivityService extends IPersistentOperation {

    List searchActivityHomeCarousel() throws Exception;

    List searchActivityHome() throws Exception;

    List searchActivityHomeHistory(String kw) throws Exception;

    Object searchActivityDetail(String id) throws Exception;

    List searchActivityDetailPhotoList(String id) throws Exception;

    List searchActivityDetailMemberList(String id) throws Exception;

    Object searchActivityMemberDetail(String id,String actid) throws Exception;

    List searchActivityTopList(String id) throws Exception;

    void actVote(String id,String actid) throws Exception;

    Map searchActMember(String id, String kw) throws Exception;
}
