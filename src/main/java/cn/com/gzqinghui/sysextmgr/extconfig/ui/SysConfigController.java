
package cn.com.gzqinghui.sysextmgr.extconfig.ui;
import cn.com.gzqinghui.sysmgr.log.annotation.SystemControllerLog;
import cn.com.gzqinghui.sysextmgr.extconfig.service.ISysConfigService;

import com.dexcoder.commons.pager.AcePageBean;
import com.dexcoder.dal.annotation.FormModel;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.com.gzqinghui.sysextmgr.extconfig.vo.SysConfigVO;
import java.io.Writer;
import java.util.Map;
import java.util.UUID;

/**
* 系统管理-扩展配置管理
* 广州清汇信息科技有限公司
* date: 2017-03-16 22:38:19
*/
@Controller
@RequestMapping("/sysextmgr/extconfig")
public class SysConfigController {

    private static final Logger log = LoggerFactory.getLogger(SysConfigController.class);

    @Autowired
    private ISysConfigService sysConfigService;

    /*
     * 获取扩展配置列表
     */
    @RequestMapping(value = "/list",produces="application/json")
    @SystemControllerLog(model="扩展配置模块",description="扩展配置列表")
    public void list(@FormModel SysConfigVO sysConfig, @ModelAttribute AcePageBean pageBean, Writer out) throws Exception{

        JSONObject json = new JSONObject();

        try {
            Map<String, Object> sysConfigs = sysConfigService.queryListByPage(sysConfig, pageBean);
            json.put("code","1");
            json.put("desc","查询成功");
            json.put("data",sysConfigs);
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","查询失败");
        }

        IOUtils.write(json.toString(),out);
    }

    /*
     * 新增扩展配置
     */
    @RequestMapping(value = "/add",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="扩展配置模块",description="新增扩展配置")
    public void add(@FormModel SysConfigVO sysConfig, Writer out) throws Exception{

        JSONObject json = new JSONObject();

        try {
            int row = sysConfigService.save(sysConfig);
            if(row < 1){
                throw new Exception("新增失败");
            }
            json.put("code","1");
            json.put("desc","新增成功");
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","新增失败");
        }

        IOUtils.write(json.toString(),out);
    }

    /*
     * 编辑扩展配置
     */
    @RequestMapping(value = "/update",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="扩展配置模块",description="编辑扩展配置")
    public void update(@FormModel SysConfigVO sysConfig, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
                        int row = sysConfigService.save(sysConfig);

            if(row < 1){
                throw new Exception("编辑失败");
            }
            json.put("code","1");
            json.put("desc","编辑成功");
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","编辑失败");
        }
        IOUtils.write(json.toString(),out);
    }

    /*
     * 物理删除扩展配置
     * 直接数据库delete
     */
    @RequestMapping(value = "/delete",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="扩展配置模块",description="删除扩展配置")
    public void delete(String ids, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            int row = sysConfigService.deleteByIds(SysConfigVO.class,ids);
            if(row < 1){
                throw new Exception("删除失败");
            }
            json.put("code","1");
            json.put("desc","删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","删除失败");
        }
        IOUtils.write(json.toString(),out);
    }

    /*
     * 逻辑删除扩展配置
     * 数据库update
     */
    @RequestMapping(value = "/deleteLogicByIds",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="扩展配置模块",description="删除扩展配置")
    public void deleteLogicByIds(String ids, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            int row = sysConfigService.deleteLogicByIds(SysConfigVO.class,ids,null);
            if(row < 1) {
                throw new Exception("删除失败");
            }
            json.put("code","1");
            json.put("desc","删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","删除失败");
        }

        IOUtils.write(json.toString(),out);
    }

}
