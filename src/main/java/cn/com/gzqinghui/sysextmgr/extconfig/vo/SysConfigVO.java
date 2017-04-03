package cn.com.gzqinghui.sysextmgr.extconfig.vo;
import com.dexcoder.dal.annotation.Column;
import com.dexcoder.dal.annotation.Table;
import com.dexcoder.dal.annotation.Transient;
import java.io.Serializable;
import com.dexcoder.commons.bean.IBaseEntity;
import java.util.Date;
import org.apache.commons.lang3.StringUtils;
import com.dexcoder.dal.annotation.DateFormat;




/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: kitom
* date: 2017-03-16 22:38:19
*/
@Table(name = "tb_config", pkField = "configKey"
, pkColumn = "CONFIG_KEY"
, defaultSort = "configKey"
)
public class SysConfigVO implements Serializable,IBaseEntity {

      
    private String configKey ;
      
    private String configValue ;
      
    private String description ;
      
    private String readOnly ;
    
    public void setConfigKey(String configKey){
        this.configKey=configKey ;
    }

        @Column(likeQuery =true)
            public String getConfigKey(){

            return this.configKey  ;
    }


    public void setConfigValue(String configValue){
        this.configValue=configValue ;
    }

        @Column(likeQuery =true)
            public String getConfigValue(){

            return this.configValue  ;
    }


    public void setDescription(String description){
        this.description=description ;
    }

        @Column(likeQuery =true)
            public String getDescription(){

            return this.description  ;
    }


    public void setReadOnly(String readOnly){
        this.readOnly=readOnly ;
    }

            public String getReadOnly(){

            return this.readOnly  ;
    }

    /**
    * 获取数据库中对应的表名
    *
    * @return
    */
    public String _getTableName() {
        return "TB_CONFIG";
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
    public String _getPKValue() {
        return StringUtils.defaultIfBlank(configKey,"");
    }

    /**
    * 设置主键的值
    *
    * @return
    */
    public void _setPKValue(Object value) {
        this.configKey =(String)value;
    }

    /**
    * 重写默认的toString方法，使其调用输出的内容更有意义
    */
    public String toString() {
        return new org.apache.commons.lang3.builder.ReflectionToStringBuilder(this, org.apache.commons.lang3.builder.ToStringStyle.SIMPLE_STYLE).toString();
    }
}
