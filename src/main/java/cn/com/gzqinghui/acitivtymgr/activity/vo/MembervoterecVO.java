package cn.com.gzqinghui.acitivtymgr.activity.vo;
import com.dexcoder.commons.bean.IBaseEntity;
import com.dexcoder.dal.annotation.Column;
import com.dexcoder.dal.annotation.Table;
import org.apache.commons.lang3.StringUtils;

import java.io.Serializable;




/**
* Copyright &copy; 2015 广州清汇信息科技有限公司
* All rights reserved.
* User: x
* date: 2017-04-10 09:38:19
*/
@Table(name = "tb_membervoterec", pkField = "id"
, pkColumn = "ID"
, defaultSort = "id"
)
public class MembervoterecVO implements Serializable,IBaseEntity {

      
    private String id ;
      
    private String openid ;
      
    private String name ;
      
    private String actId ;
      
    private String menber ;
      
    private String ip ;
    
    public void setId(String id){
        this.id=id ;
    }

        @Column(likeQuery =true)
            public String getId(){

            return this.id  ;
    }


    public void setOpenid(String openid){
        this.openid=openid ;
    }

        @Column(likeQuery =true)
            public String getOpenid(){

            return this.openid  ;
    }


    public void setName(String name){
        this.name=name ;
    }

        @Column(likeQuery =true)
            public String getName(){

            return this.name  ;
    }


    public void setActId(String actId){
        this.actId=actId ;
    }

        @Column(likeQuery =true)
            public String getActId(){

            return this.actId  ;
    }


    public void setMenber(String menber){
        this.menber=menber ;
    }

        @Column(likeQuery =true)
            public String getMenber(){

            return this.menber  ;
    }


    public void setIp(String ip){
        this.ip=ip ;
    }

        @Column(likeQuery =true)
            public String getIp(){

            return this.ip  ;
    }

    /**
    * 获取数据库中对应的表名
    *
    * @return
    */
    public String _getTableName() {
        return "TB_MEMBERVOTEREC";
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
