
package cn.com.gzqinghui.mob.usercenter.usermain.ui;

import cn.com.gzqinghui.mob.usercenter.usermain.service.IUsermainService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
* 广州清汇信息科技有限公司
* date: 2017-04-05 09:09:18
*/
@Controller
@RequestMapping("/mob/usermain")
public class UsermainController {

    private static final Logger log = LoggerFactory.getLogger(UsermainController.class);

    @Resource
    private IUsermainService mobUsermainService;



}
