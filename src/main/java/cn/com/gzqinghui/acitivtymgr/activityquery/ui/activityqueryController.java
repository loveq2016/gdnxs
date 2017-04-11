
package cn.com.gzqinghui.acitivtymgr.activityquery.ui;

import cn.com.gzqinghui.acitivtymgr.activityquery.service.IactivityqueryService;
import cn.com.gzqinghui.common.util.Base64Encode;
import cn.com.gzqinghui.common.util.ReportUtil;
import cn.com.gzqinghui.sysmgr.log.annotation.SystemControllerLog;
import com.dexcoder.commons.pager.AcePageBean;
import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.Map;

/**
* 活动管理-团员管理管理
* 广州清汇信息科技有限公司
* date: 2017-04-05 17:27:30
*/
@Controller
@RequestMapping("/acitivtymgr/activityquery")
public class activityqueryController {

    private static final Logger log = LoggerFactory.getLogger(activityqueryController.class);

    @Autowired
    private IactivityqueryService activityqueryService;

    /*
     * 获取团员管理列表
     */
    @RequestMapping(value = "/list",produces="application/json")
    @SystemControllerLog(model="活动管理模块",description="活动结果查询")
    public void list(@ModelAttribute AcePageBean pageBean, Writer out) throws Exception{

        JSONObject json = new JSONObject();

        try {
            Map<String, Object> activityquerys = activityqueryService.queryActQueryMapListByPage(pageBean);
            json.put("code","1");
            json.put("desc","查询成功");
            json.put("data",activityquerys);
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","查询失败");
        }

        IOUtils.write(json.toString(),out);
    }



    @RequestMapping("/export")
    @ResponseBody
    @SystemControllerLog(model="活动管理模块",description="活动结果导出")
    public void export(AcePageBean pageBean,HttpServletResponse response,HttpServletRequest request) throws Exception {
        List cacheList = activityqueryService.queryActList(pageBean);
        File excelFile = ReportUtil.exportForExcel(new String[]{"序号", "title", "name", "genderDesc", "work","peopleDesc", "concatPhone", "birthday","city", "area", "specialty", "votenum"},
                new String[]{"序号", "活动", "姓名", "性别", "单位","民族", "联系号码", "生日",  "城市","区域", "特长","获得票数"}, cacheList);
        InputStream is = null;
        OutputStream os = null;
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        //以流的形式输出文件
        try {
            if (excelFile.exists()) {
                String fileName = "活动结果统计导出.xls";

                is = new FileInputStream(excelFile);
                os = response.getOutputStream();
                bis = new BufferedInputStream(is);
                bos = new BufferedOutputStream(os);

//  					fileName = java.net.URLEncoder.encode(fileName, "UTF-8");// 处理中文文件名的问题
//  					fileName = new String(fileName.getBytes("UTF-8"), "GBK");// 处理中文文件名的问题

                // 设置Content-Disposition(处理文件中文名字)
                String agent = request.getHeader("user-agent");
                if (agent.contains("MSIE")) {
                    // IE浏览器 --- URL编码
                    fileName = java.net.URLEncoder.encode(fileName, "utf-8");
                } else if (agent.contains("Firefox")) {
                    // 火狐浏览器 --- Base64编码
                    fileName = Base64Encode.base64EncodeFileName(fileName);
                } else {
                    fileName = java.net.URLEncoder.encode(fileName, "utf-8");
                }

                response.reset();
                response.setCharacterEncoding("UTF-8");
                response.setContentType("application/ vnd.ms-excel");// 不同类型的文件对应不同的MIME类型

                response.setHeader("Content-Disposition",
                        "attachment; filename=" + fileName);
                int bytesRead = 0;
                byte[] buffer = new byte[1024];
                while ((bytesRead = bis.read(buffer)) != -1) {
                    bos.write(buffer, 0, bytesRead);// 将文件发送到客户端
                }
                bos.flush();
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        } finally{
            IOUtils.closeQuietly(bis);
            IOUtils.closeQuietly(bos);
            IOUtils.closeQuietly(is);
            IOUtils.closeQuietly(os);
            excelFile.delete();
        }
    }


}
