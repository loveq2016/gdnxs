package cn.com.gzqinghui.sysextmgr.mvoice.model;

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
* User: kki
*/
@Table(name = "tb_sy_multi_voice", pkField = "id"
, pkColumn = "id"
, defaultSort = "id"
)
public class MvoicePO implements Serializable,IBaseEntity {
    private java.lang.String id ;
    private java.lang.String keyName ;
    private java.lang.String chinaName ;
    private java.lang.String englishName ;
    private java.lang.String status ;
    private java.lang.String createPerson ;
    private java.util.Date createTime ;
    
    public void setId(java.lang.String id){
    this.id=id ;
    }

    
    
    public java.lang.String getId(){
       return this.id  ;
    }

    
    public void setKeyName(java.lang.String keyName){
    this.keyName=keyName ;
    }

    
    
    public java.lang.String getKeyName(){
       return this.keyName  ;
    }

    
    public void setChinaName(java.lang.String chinaName){
    this.chinaName=chinaName ;
    }

    
    
    public java.lang.String getChinaName(){
       return this.chinaName  ;
    }

    
    public void setEnglishName(java.lang.String englishName){
    this.englishName=englishName ;
    }

    
    
    public java.lang.String getEnglishName(){
       return this.englishName  ;
    }

    
    public void setStatus(java.lang.String status){
    this.status=status ;
    }

    
    
    public java.lang.String getStatus(){
       return this.status  ;
    }

    
    public void setCreatePerson(java.lang.String createPerson){
    this.createPerson=createPerson ;
    }

    
    
    public java.lang.String getCreatePerson(){
       return this.createPerson  ;
    }

    
    public void setCreateTime(java.util.Date createTime){
    this.createTime=createTime ;
    }

        public void setCreateTime(String createTime){
        ConvertUtils.register(new DateConvert(),Date.class);
        this.createTime= (Date) ConvertUtils.convert(createTime,Date.class);
    }
    
    
    public java.util.Date getCreateTime(){
       return this.createTime  ;
    }

        /**
    * 获取数据库中对应的表名
    *
    * @return
    */
    public String _getTableName() {
    return "tb_sy_multi_voice";
    }

    /**
    * 获取对应表的主键字段名称
    *
    * @return
    */
    public String _getPKColumnName() {
    return "id";
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
