package cn.com.gzqinghui.acitivtymgr.member.model;

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
@Table(name = "tb_member_info", pkField = "id"
, pkColumn = "ID"
, defaultSort = "id"
)
public class MemberPO implements Serializable,IBaseEntity {
    private java.lang.String id ;
    private java.lang.String name ;
    private java.lang.String gender ;
    private java.lang.String work ;
    private java.lang.String concatPhone ;
    private java.util.Date birthday ;
    private java.lang.String area ;
    private java.lang.String specialty ;
    private java.lang.String selfdesc ;
    private java.lang.String avatar ;
    private java.lang.String profile ;
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

    
    public void setName(java.lang.String name){
    this.name=name ;
    }

    
    
    public java.lang.String getName(){
       return this.name  ;
    }

    
    public void setGender(java.lang.String gender){
    this.gender=gender ;
    }

    
    
    public java.lang.String getGender(){
       return this.gender  ;
    }

    
    public void setWork(java.lang.String work){
    this.work=work ;
    }

    
    
    public java.lang.String getWork(){
       return this.work  ;
    }

    
    public void setConcatPhone(java.lang.String concatPhone){
    this.concatPhone=concatPhone ;
    }

    
    
    public java.lang.String getConcatPhone(){
       return this.concatPhone  ;
    }

    
    public void setBirthday(java.util.Date birthday){
    this.birthday=birthday ;
    }

        public void setBirthday(String birthday){
        ConvertUtils.register(new DateConvert(),Date.class);
        this.birthday= (Date) ConvertUtils.convert(birthday,Date.class);
    }
    
    
    public java.util.Date getBirthday(){
       return this.birthday  ;
    }

    
    public void setArea(java.lang.String area){
    this.area=area ;
    }

    
    
    public java.lang.String getArea(){
       return this.area  ;
    }

    
    public void setSpecialty(java.lang.String specialty){
    this.specialty=specialty ;
    }

    
    
    public java.lang.String getSpecialty(){
       return this.specialty  ;
    }

    
    public void setSelfdesc(java.lang.String selfdesc){
    this.selfdesc=selfdesc ;
    }

    
    
    public java.lang.String getSelfdesc(){
       return this.selfdesc  ;
    }

    
    public void setAvatar(java.lang.String avatar){
    this.avatar=avatar ;
    }

    
    
    public java.lang.String getAvatar(){
       return this.avatar  ;
    }

    
    public void setProfile(java.lang.String profile){
    this.profile=profile ;
    }

    
    
    public java.lang.String getProfile(){
       return this.profile  ;
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
    return "tb_member_info";
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
