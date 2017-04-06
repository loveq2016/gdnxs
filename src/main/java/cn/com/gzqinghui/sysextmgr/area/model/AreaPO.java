package cn.com.gzqinghui.sysextmgr.area.model;

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
@Table(name = "tb_area", pkField = "id"
, pkColumn = "ID"
, defaultSort = "id"
)
public class AreaPO implements Serializable,IBaseEntity {
    private java.lang.String id ;
    private java.lang.String city ;
    private java.lang.String areatext ;
    private java.util.Date createdate ;
    
    public void setId(java.lang.String id){
    this.id=id ;
    }

    
    
    public java.lang.String getId(){
       return this.id  ;
    }

    
    public void setCity(java.lang.String city){
    this.city=city ;
    }

    
    
    public java.lang.String getCity(){
       return this.city  ;
    }

    
    public void setAreatext(java.lang.String areatext){
    this.areatext=areatext ;
    }

    
    
    public java.lang.String getAreatext(){
       return this.areatext  ;
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
    return "tb_area";
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
