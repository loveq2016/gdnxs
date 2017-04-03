package cn.com.gzqinghui.sysextmgr.mvoice.vo;
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
* User: kki
* date: 2017-03-24 13:36:19
*/
@Table(name = "tb_sy_multi_voice", pkField = "id"
, pkColumn = "id"
, defaultSort = "id"
)
public class MvoiceVO implements Serializable,IBaseEntity {

      
    private String id ;
      
    private String keyName ;
      
    private String chinaName ;
      
    private String englishName ;
      
    private String status ;
      
    private String createPerson ;
      
    private String createTime ;
    
    public void setId(String id){
        this.id=id ;
    }

            public String getId(){

            return this.id  ;
    }


    public void setKeyName(String keyName){
        this.keyName=keyName ;
    }

        @Column(likeQuery =true)
            public String getKeyName(){

            return this.keyName  ;
    }


    public void setChinaName(String chinaName){
        this.chinaName=chinaName ;
    }

        @Column(likeQuery =true)
            public String getChinaName(){

            return this.chinaName  ;
    }


    public void setEnglishName(String englishName){
        this.englishName=englishName ;
    }

        @Column(likeQuery =true)
            public String getEnglishName(){

            return this.englishName  ;
    }


    public void setStatus(String status){
        this.status=status ;
    }

        @Column(likeQuery =true)
            public String getStatus(){

            return this.status  ;
    }


    public void setCreatePerson(String createPerson){
        this.createPerson=createPerson ;
    }

        @Column(likeQuery =true)
            public String getCreatePerson(){

            return this.createPerson  ;
    }


    public void setCreateTime(String createTime){
        this.createTime=createTime ;
    }

            @DateFormat
        public String getCreateTime(){

            return this.createTime  ;
    }

    /**
    * 获取数据库中对应的表名
    *
    * @return
    */
    public String _getTableName() {
        return "TB_SY_MULTI_VOICE";
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
