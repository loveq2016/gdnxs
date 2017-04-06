
package cn.com.gzqinghui.messagemgr.msginfo.ui;
import cn.com.gzqinghui.sysmgr.log.annotation.SystemControllerLog;
import cn.com.gzqinghui.messagemgr.msginfo.service.IMsginfoService;
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

import cn.com.gzqinghui.messagemgr.msginfo.vo.MsginfoVO;
import java.io.Writer;
import java.util.Map;
import java.util.UUID;

/**
* 信息管理-消息管理管理
* 广州清汇信息科技有限公司
* date: 2017-04-06 11:41:19
*/
@Controller
@RequestMapping("/messagemgr/msginfo")
public class MsginfoController {

    private static final Logger log = LoggerFactory.getLogger(MsginfoController.class);

    @Autowired
    private IMsginfoService msginfoService;

    /*
     * 获取消息管理列表
     */
    @RequestMapping(value = "/list",produces="application/json")
    @SystemControllerLog(model="消息管理模块",description="消息管理列表")
    public void list(@FormModel MsginfoVO msginfo, @ModelAttribute AcePageBean pageBean, Writer out) throws Exception{

        JSONObject json = new JSONObject();

        try {
            Map<String, Object> msginfos = msginfoService.queryListByPage(msginfo, pageBean);
            json.put("code","1");
            json.put("desc","查询成功");
            json.put("data",msginfos);
        } catch (Exception e) {
            e.printStackTrace();
            json.put("code","0");
            json.put("desc","查询失败");
        }

        IOUtils.write(json.toString(),out);
    }


}
