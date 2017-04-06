package cn.com.gzqinghui.messagemgr.msginfo.model;

import com.dexcoder.dal.annotation.Table;
import com.dexcoder.dal.annotation.Transient;
import com.dexcoder.commons.bean.DateConvert;
import java.io.Serializable;
import com.dexcoder.commons.bean.IBaseEntity;
import java.util.Date;
import org.apache.commons.beanutils.ConvertUtils;
/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: x
*/
@Table(name = "tb_msg_info", pkField = "id"
, pkColumn = "ID"
, defaultSort = "id"
)
public class MsginfoPO implements Serializable,IBaseEntity {
    private java.lang.String id ;
    private java.lang.String title ;
    private java.lang.String msgdesc ;
    private java.lang.String creatorid ;
    private java.util.Date createdate ;
    
    public void setId(java.lang.String id){
    this.id=id ;
    }

    
    
    public java.lang.String getId(){
       return this.id  ;
    }

    
    public void setTitle(java.lang.String title){
    this.title=title ;
    }

    
    
    public java.lang.String getTitle(){
       return this.title  ;
    }

    
    public void setMsgdesc(java.lang.String msgdesc){
    this.msgdesc=msgdesc ;
    }

    
    
    public java.lang.String getMsgdesc(){
       return this.msgdesc  ;
    }

    
    public void setCreatorid(java.lang.String creatorid){
    this.creatorid=creatorid ;
    }

    
    
    public java.lang.String getCreatorid(){
       return this.creatorid  ;
    }

    
    public void setCreatedate(java.util.Date createdate){
    this.createdate=createdate ;
    }

        public void setCreatedate(String createdate){
        ConvertUtils.register(new DateConvert(),Date.class);
        this.createdate= (Date) ConvertUtils.convert(createdate,Date.class);
    }
    
    
    public java.util.Date getCreatedate(){
       return this.createdate  ;
    }

        /**
    * 获取数据库中对应的表名
    *
    * @return
    */
    public String _getTableName() {
    return "tb_msg_info";
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
    public java.lang.String _getPKValue() {
    return id;
    }

    /**
    * 设置主键的值
    *
    * @return
    */
    public void _setPKValue(Object value) {
    this.id = (java.lang.String)value;
    }

    /**
    * 重写默认的toString方法，使其调用输出的内容更有意义
    */
    public String toString() {
    return new org.apache.commons.lang3.builder.ReflectionToStringBuilder(this, org.apache.commons.lang3.builder.ToStringStyle.SIMPLE_STYLE).toString();
    }
    }
