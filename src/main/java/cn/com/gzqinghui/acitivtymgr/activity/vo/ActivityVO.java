package cn.com.gzqinghui.acitivtymgr.activity.vo;
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
* date: 2017-04-05 09:09:18
*/
@Table(name = "tb_activity_info", pkField = "id"
, pkColumn = "ID"
, defaultSort = "id"
)
public class ActivityVO implements Serializable,IBaseEntity {

      
    private String id ;
      
    private String title ;
      
    private String homepagep ;
      
    private String endTime ;
      
    private String isPushHomepage ;
      
    private String activiyDesc ;
      
    private String astatus ;
      
    private String creatorid ;
      
    private String createdate ;
      
    private String modifiedid ;
      
    private String modifieddate ;
      
    private String deletedflag ;
    
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


    public void setHomepagep(String homepagep){
        this.homepagep=homepagep ;
    }

        @Column(likeQuery =true)
            public String getHomepagep(){

            return this.homepagep  ;
    }


    public void setEndTime(String endTime){
        this.endTime=endTime ;
    }

            @DateFormat
        public String getEndTime(){

            return this.endTime  ;
    }


    public void setIsPushHomepage(String isPushHomepage){
        this.isPushHomepage=isPushHomepage ;
    }

        @Column(likeQuery =true)
            public String getIsPushHomepage(){

            return this.isPushHomepage  ;
    }


    public void setActiviyDesc(String activiyDesc){
        this.activiyDesc=activiyDesc ;
    }

        @Column(likeQuery =true)
            public String getActiviyDesc(){

            return this.activiyDesc  ;
    }


    public void setAstatus(String astatus){
        this.astatus=astatus ;
    }

        @Column(likeQuery =true)
            public String getAstatus(){

            return this.astatus  ;
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


    public void setModifiedid(String modifiedid){
        this.modifiedid=modifiedid ;
    }

        @Column(likeQuery =true)
            public String getModifiedid(){

            return this.modifiedid  ;
    }


    public void setModifieddate(String modifieddate){
        this.modifieddate=modifieddate ;
    }

            @DateFormat
        public String getModifieddate(){

            return this.modifieddate  ;
    }


    public void setDeletedflag(String deletedflag){
        this.deletedflag=deletedflag ;
    }

            public String getDeletedflag(){

            return this.deletedflag  ;
    }

    /**
    * 获取数据库中对应的表名
    *
    * @return
    */
    public String _getTableName() {
        return "TB_ACTIVITY_INFO";
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
