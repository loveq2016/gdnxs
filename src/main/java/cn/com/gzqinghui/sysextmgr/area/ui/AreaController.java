
package cn.com.gzqinghui.sysextmgr.area.ui;
import cn.com.gzqinghui.sysmgr.log.annotation.SystemControllerLog;
import cn.com.gzqinghui.sysextmgr.area.service.IAreaService;
import org.apache.commons.lang3.StringUtils;
import com.dexcoder.commons.pager.AcePageBean;
import com.dexcoder.dal.annotation.FormModel;
import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.com.gzqinghui.sysextmgr.area.vo.AreaVO;
import java.io.Writer;
import java.util.Map;
import java.util.UUID;

/**
* 系统管理-区域管理管理
* 广州清汇信息科技有限公司
* date: 2017-04-06 16:25:15
*/
@Controller
@RequestMapping("/sysextmgr/area")
public class AreaController {

    private static final Logger log = LoggerFactory.getLogger(AreaController.class);

    @Autowired
    private IAreaService areaService;

    /*
     * 获取区域管理列表
     */
    @RequestMapping(value = "/list",produces="application/json")
    @SystemControllerLog(model="区域管理模块",description="区域管理列表")
    public void list(@FormModel AreaVO area, @ModelAttribute AcePageBean pageBean, Writer out) throws Exception{

        JSONObject json = new JSONObject();

        try {
            Map<String, Object> areas = areaService.queryListByPage(area, pageBean);
            json.put("code","1");
            json.put("desc","查询成功");
            json.put("data",areas);
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","查询失败");
        }

        IOUtils.write(json.toString(),out);
    }

    /*
     * 新增区域管理
     */
    @RequestMapping(value = "/add",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="区域管理模块",description="新增区域管理")
    public void add(@FormModel AreaVO area, Writer out) throws Exception{

        JSONObject json = new JSONObject();

        try {
            int row = areaService.save(area);
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
     * 编辑区域管理
     */
    @RequestMapping(value = "/update",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="区域管理模块",description="编辑区域管理")
    public void update(@FormModel AreaVO area, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
                        int row = StringUtils.isNotBlank(area.getId())
                      ? areaService.update(area)
                        :areaService.save(area);

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
     * 物理删除区域管理
     * 直接数据库delete
     */
    @RequestMapping(value = "/delete",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="区域管理模块",description="删除区域管理")
    public void delete(String ids, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            int row = areaService.deleteByIds(AreaVO.class,ids);
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
     * 逻辑删除区域管理
     * 数据库update
     */
    @RequestMapping(value = "/deleteLogicByIds",produces="application/json",method= RequestMethod.POST)
    @SystemControllerLog(model="区域管理模块",description="删除区域管理")
    public void deleteLogicByIds(String ids, Writer out) throws Exception{

        JSONObject json = new JSONObject();
        try {
            int row = areaService.deleteLogicByIds(AreaVO.class,ids,null);
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
