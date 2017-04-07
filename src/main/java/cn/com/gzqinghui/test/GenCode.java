package cn.com.gzqinghui.test;

import cn.com.gzqinghui.sysmgr.common.util.DateUtil;
import com.framebase.core.GeneratorCore;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by signheart on 2017-04-03.
 */
public class GenCode {

    public static void main(String[] arges) throws Exception {
        Map<String, Object> params = new HashMap<String, Object>();
// 生成文件路径设定,可选项
        params.put("rootPath", "F:/diyw/gdnxs");//生成文件的项目根路径
        params.put("srcRootPath", "mob");//生成java文件的路径
        params.put("webRootPath", "src/main/webapp/jsp");//生成jsp文件的路径
// 数据库信息设定,必填项
        params.put("tableName", "tb_activity_info");//生成模块对应的表明
        params.put("dbName", "basep");//数据库名称

// Java文件信息设定,必填项
        params.put("componentName","index");//组件包名
        params.put("moduelName", "activity");//模块包名
        params.put("javaName", "Activity");//生成文件的前缀
        // java文件中注释设定,必填项
        params.put("componentName_zh_CN", "微信专题活动");//组件中文名
        params.put("moduelName_zh_CN", "活动管理");//模块中文名
        params.put("user", "x");//当前开发者
//params.put("unDeleteValue", "5");//非删除值,默认0代表未删除
        //params.put("deleteFiled", "status");//删除标示属性,默认isDel
        params.put("time", DateUtil.formartCurrentDateTime());//生成文件时间

        GeneratorCore generator = new GeneratorCore(params);

        generator.createVo();//生成vo
        generator.createPo();//生成po
        generator.createService();//生成service接口
        generator.createServiceImpl();//生成service 实现接口
        generator.createController();//
        //generator.createJsp();


    }

}
