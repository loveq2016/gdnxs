package cn.com.gzqinghui.sysextmgr.extconfig.model;

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
* User: kitom
*/
@Table(name = "tb_config", pkField = "configKey"
, pkColumn = "CONFIG_KEY"
, defaultSort = "configKey"
)
public class SysConfigPO implements Serializable,IBaseEntity {
    private java.lang.String configKey ;
    private java.lang.String configValue ;
    private java.lang.String description ;
    private java.lang.Boolean readOnly ;
    
    public void setConfigKey(java.lang.String configKey){
    this.configKey=configKey ;
    }

    
    
    public java.lang.String getConfigKey(){
       return this.configKey  ;
    }

    
    public void setConfigValue(java.lang.String configValue){
    this.configValue=configValue ;
    }

    
    
    public java.lang.String getConfigValue(){
       return this.configValue  ;
    }

    
    public void setDescription(java.lang.String description){
    this.description=description ;
    }

    
    
    public java.lang.String getDescription(){
       return this.description  ;
    }

    
    public void setReadOnly(java.lang.Boolean readOnly){
    this.readOnly=readOnly ;
    }

    
    
    public java.lang.Boolean getReadOnly(){
       return this.readOnly  ;
    }

        /**
    * 获取数据库中对应的表名
    *
    * @return
    */
    public String _getTableName() {
    return "tb_config";
    }

    /**
    * 获取对应表的主键字段名称
    *
    * @return
    */
    public String _getPKColumnName() {
    return "CONFIG_KEY";
    }

    /**
    * 获取主键值
    *
    * @return
    */
    public java.lang.String _getPKValue() {
    return configKey;
    }

    /**
    * 设置主键的值
    *
    * @return
    */
    public void _setPKValue(Object value) {
    this.configKey = (java.lang.String)value;
    }

    /**
    * 重写默认的toString方法，使其调用输出的内容更有意义
    */
    public String toString() {
    return new org.apache.commons.lang3.builder.ReflectionToStringBuilder(this, org.apache.commons.lang3.builder.ToStringStyle.SIMPLE_STYLE).toString();
    }
    }
