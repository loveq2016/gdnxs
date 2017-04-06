package cn.com.gzqinghui.sysextmgr.area.vo;
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
* User: x
* date: 2017-04-06 16:25:15
*/
@Table(name = "tb_area", pkField = "id"
, pkColumn = "ID"
, defaultSort = "id"
)
public class AreaVO implements Serializable,IBaseEntity {

      
    private String id ;
      
    private String city ;
      
    private String areatext ;
      
    private String createdate ;
    
    public void setId(String id){
        this.id=id ;
    }

        @Column(likeQuery =true)
            public String getId(){

            return this.id  ;
    }


    public void setCity(String city){
        this.city=city ;
    }

        @Column(likeQuery =true)
            public String getCity(){

            return this.city  ;
    }


    public void setAreatext(String areatext){
        this.areatext=areatext ;
    }

        @Column(likeQuery =true)
            public String getAreatext(){

            return this.areatext  ;
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
        return "TB_AREA";
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
