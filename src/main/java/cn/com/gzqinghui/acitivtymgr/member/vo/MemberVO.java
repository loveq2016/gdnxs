package cn.com.gzqinghui.acitivtymgr.member.vo;
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
* date: 2017-04-03 13:21:54
*/
@Table(name = "tb_member_info", pkField = "id"
, pkColumn = "ID"
, defaultSort = "id"
)
public class MemberVO implements Serializable,IBaseEntity {

      
    private String id ;
      
    private String name ;
      
    private String gender ;
      
    private String work ;
      
    private String concatPhone ;
      
    private String birthday ;
      
    private String area ;
      
    private String specialty ;
      
    private String selfdesc ;
      
    private String avatar ;
      
    private String profile ;
      
    private String creatorid ;
      
    private String createdate ;
      
    private String modifiedid ;
      
    private String modifieddate ;
      
    private String deletedflag ;

    private String mtype;

    private String city;

    private String people;

    public String getPeople() {
        return people;
    }

    public void setPeople(String people) {
        this.people = people;
    }

    public String getMtype() {
        return mtype;
    }

    public void setMtype(String mtype) {
        this.mtype = mtype;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setId(String id){
        this.id=id ;
    }

        @Column(likeQuery =true)
            public String getId(){

            return this.id  ;
    }


    public void setName(String name){
        this.name=name ;
    }

        @Column(likeQuery =true)
            public String getName(){

            return this.name  ;
    }


    public void setGender(String gender){
        this.gender=gender ;
    }

        @Column(likeQuery =true)
            public String getGender(){

            return this.gender  ;
    }


    public void setWork(String work){
        this.work=work ;
    }

        @Column(likeQuery =true)
            public String getWork(){

            return this.work  ;
    }


    public void setConcatPhone(String concatPhone){
        this.concatPhone=concatPhone ;
    }

        @Column(likeQuery =true)
            public String getConcatPhone(){

            return this.concatPhone  ;
    }


    public void setBirthday(String birthday){
        this.birthday=birthday ;
    }

        public String getBirthday(){

            return this.birthday  ;
    }


    public void setArea(String area){
        this.area=area ;
    }

        @Column(likeQuery =true)
            public String getArea(){

            return this.area  ;
    }


    public void setSpecialty(String specialty){
        this.specialty=specialty ;
    }

        @Column(likeQuery =true)
            public String getSpecialty(){

            return this.specialty  ;
    }


    public void setSelfdesc(String selfdesc){
        this.selfdesc=selfdesc ;
    }

        @Column(likeQuery =true)
            public String getSelfdesc(){

            return this.selfdesc  ;
    }


    public void setAvatar(String avatar){
        this.avatar=avatar ;
    }

        @Column(likeQuery =true)
            public String getAvatar(){

            return this.avatar  ;
    }


    public void setProfile(String profile){
        this.profile=profile ;
    }

        @Column(likeQuery =true)
            public String getProfile(){

            return this.profile  ;
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
        return "TB_MEMBER_INFO";
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
