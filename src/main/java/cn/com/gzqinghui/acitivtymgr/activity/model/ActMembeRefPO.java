package cn.com.gzqinghui.acitivtymgr.activity.model;

import com.dexcoder.commons.bean.DateConvert;
import com.dexcoder.commons.bean.IBaseEntity;
import com.dexcoder.dal.annotation.Table;
import org.apache.commons.beanutils.ConvertUtils;

import java.io.Serializable;
import java.util.Date;

/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: x
*/
@Table(name = "tb_act_member_ref", pkField = "id"
, pkColumn = "ID"
, defaultSort = "id"
)
public class ActMembeRefPO implements Serializable,IBaseEntity {
    private String id ;
    private String actId ;
    private String memberId ;
    private Integer no ;
    private Integer votenum ;
    private String creatorid ;
    private Date createdate ;

    public void setId(String id){
    this.id=id ;
    }



    public String getId(){
       return this.id  ;
    }


    public void setActId(String actId){
    this.actId=actId ;
    }



    public String getActId(){
       return this.actId  ;
    }


    public void setMemberId(String memberId){
    this.memberId=memberId ;
    }



    public String getMemberId(){
       return this.memberId  ;
    }


    public void setNo(Integer no){
    this.no=no ;
    }



    public Integer getNo(){
       return this.no  ;
    }


    public void setVotenum(Integer votenum){
    this.votenum=votenum ;
    }



    public Integer getVotenum(){
       return this.votenum  ;
    }


    public void setCreatorid(String creatorid){
    this.creatorid=creatorid ;
    }



    public String getCreatorid(){
       return this.creatorid  ;
    }


    public void setCreatedate(Date createdate){
    this.createdate=createdate ;
    }

        public void setCreatedate(String createdate){
        ConvertUtils.register(new DateConvert(),Date.class);
        this.createdate= (Date) ConvertUtils.convert(createdate,Date.class);
    }


    public Date getCreatedate(){
       return this.createdate  ;
    }

        /**
    * 获取数据库中对应的表名
    *
    * @return
    */
    public String _getTableName() {
    return "tb_act_member_ref";
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
    return id;
    }

    /**
    * 设置主键的值
    *
    * @return
    */
    public void _setPKValue(Object value) {
    this.id = (String)value;
    }

    /**
    * 重写默认的toString方法，使其调用输出的内容更有意义
    */
    public String toString() {
    return new org.apache.commons.lang3.builder.ReflectionToStringBuilder(this, org.apache.commons.lang3.builder.ToStringStyle.SIMPLE_STYLE).toString();
    }
    }
