package cn.com.gzqinghui.messagemgr.msginfo.vo;
import com.dexcoder.commons.bean.IBaseEntity;
import com.dexcoder.dal.annotation.Column;
import com.dexcoder.dal.annotation.DateFormat;
import com.dexcoder.dal.annotation.Table;
import org.apache.commons.lang3.StringUtils;

import java.io.Serializable;




/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: x
* date: 2017-04-06 11:41:19
*/
@Table(name = "tb_msg_info", pkField = "id"
, pkColumn = "ID"
, defaultSort = "id"
)
public class MsginfoVO implements Serializable,IBaseEntity {

      
    private String id ;
      
    private String title ;

    private String memberId;
      
    private String msgdesc ;
      
    private String creatorid ;
      
    private String createdate ;

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public void setId(String id){
        this.id=id ;
    }

        @Column(likeQuery =true)
            public String getId(){

            return this.id  ;
    }


    public void setTitle(String title){
        this.title=title ;
    }

        @Column(likeQuery =true)
            public String getTitle(){

            return this.title  ;
    }


    public void setMsgdesc(String msgdesc){
        this.msgdesc=msgdesc ;
    }

        @Column(likeQuery =true)
            public String getMsgdesc(){

            return this.msgdesc  ;
    }


    public void setCreatorid(String creatorid){
        this.creatorid=creatorid ;
    }

        @Column(likeQuery =true)
            public String getCreatorid(){

            return this.creatorid  ;
    }


    public void setCreatedate(String createdate){
        this.createdate=createdate ;
    }

            @DateFormat
        public String getCreatedate(){

            return this.createdate  ;
    }

    /**
    * 获取数据库中对应的表名
    *
    * @return
    */
    public String _getTableName() {
        return "TB_MSG_INFO";
    }

    /**
    * 获取对应表的主键字段名称
    *
    * @return
    */
    public String _getPKColumnName() {
        return "ID";
    }

    /**
    * 获取主键值
    *
    * @return
    */
    public String _getPKValue() {
        return StringUtils.defaultIfBlank(id,"");
    }

    /**
    * 设置主键的值
    *
    * @return
    */
    public void _setPKValue(Object value) {
        this.id =(String)value;
    }

    /**
    * 重写默认的toString方法，使其调用输出的内容更有意义
    */
    public String toString() {
        return new org.apache.commons.lang3.builder.ReflectionToStringBuilder(this, org.apache.commons.lang3.builder.ToStringStyle.SIMPLE_STYLE).toString();
    }
}
