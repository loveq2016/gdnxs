package cn.com.gzqinghui.acitivtymgr.activity.model;

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
@Table(name = "tb_activity_pics", pkField = "id"
, pkColumn = "ID"
, defaultSort = "id"
)
public class ActivityPhotoPO implements Serializable,IBaseEntity {
    private java.lang.String id ;
    private java.lang.String actId ;
    private java.lang.String psesc ;
    private java.lang.String purl ;
    private java.lang.String creatorid ;
    private java.util.Date createdate ;
    private java.lang.String modifiedid ;
    private java.util.Date modifieddate ;
    private java.lang.Integer deletedflag ;
    
    public void setId(java.lang.String id){
    this.id=id ;
    }

    
    
    public java.lang.String getId(){
       return this.id  ;
    }

    
    public void setActId(java.lang.String actId){
    this.actId=actId ;
    }

    
    
    public java.lang.String getActId(){
       return this.actId  ;
    }

    
    public void setPsesc(java.lang.String psesc){
    this.psesc=psesc ;
    }

    
    
    public java.lang.String getPsesc(){
       return this.psesc  ;
    }

    
    public void setPurl(java.lang.String purl){
    this.purl=purl ;
    }

    
    
    public java.lang.String getPurl(){
       return this.purl  ;
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

    
    public void setModifiedid(java.lang.String modifiedid){
    this.modifiedid=modifiedid ;
    }

    
    
    public java.lang.String getModifiedid(){
       return this.modifiedid  ;
    }

    
    public void setModifieddate(java.util.Date modifieddate){
    this.modifieddate=modifieddate ;
    }

        public void setModifieddate(String modifieddate){
        ConvertUtils.register(new DateConvert(),Date.class);
        this.modifieddate= (Date) ConvertUtils.convert(modifieddate,Date.class);
    }
    
    
    public java.util.Date getModifieddate(){
       return this.modifieddate  ;
    }

    
    public void setDeletedflag(java.lang.Integer deletedflag){
    this.deletedflag=deletedflag ;
    }

    
    
    public java.lang.Integer getDeletedflag(){
       return this.deletedflag  ;
    }

        /**
    * 获取数据库中对应的表名
    *
    * @return
    */
    public String _getTableName() {
    return "tb_activity_pics";
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
