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
@Table(name = "tb_membervoterec", pkField = "id"
, pkColumn = "ID"
, defaultSort = "id"
)
public class MembervoterecPO implements Serializable,IBaseEntity {
    private java.lang.String id ;
    private java.lang.String openid ;
    private java.lang.String name ;
    private java.lang.String actId ;
    private java.lang.String menber ;
    private java.lang.String ip ;
    
    public void setId(java.lang.String id){
    this.id=id ;
    }

    
    
    public java.lang.String getId(){
       return this.id  ;
    }

    
    public void setOpenid(java.lang.String openid){
    this.openid=openid ;
    }

    
    
    public java.lang.String getOpenid(){
       return this.openid  ;
    }

    
    public void setName(java.lang.String name){
    this.name=name ;
    }

    
    
    public java.lang.String getName(){
       return this.name  ;
    }

    
    public void setActId(java.lang.String actId){
    this.actId=actId ;
    }

    
    
    public java.lang.String getActId(){
       return this.actId  ;
    }

    
    public void setMenber(java.lang.String menber){
    this.menber=menber ;
    }

    
    
    public java.lang.String getMenber(){
       return this.menber  ;
    }

    
    public void setIp(java.lang.String ip){
    this.ip=ip ;
    }

    
    
    public java.lang.String getIp(){
       return this.ip  ;
    }

        /**
    * 获取数据库中对应的表名
    *
    * @return
    */
    public String _getTableName() {
    return "tb_membervoterec";
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
