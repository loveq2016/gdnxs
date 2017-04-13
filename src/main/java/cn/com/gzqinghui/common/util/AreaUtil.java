package cn.com.gzqinghui.common.util;

import cn.com.gzqinghui.sysextmgr.area.vo.AreaVO;
import cn.com.gzqinghui.sysmgr.common.util.JsonUtil;
import cn.com.gzqinghui.sysmgr.common.util.ValidateUtil;
import cn.com.gzqinghui.sysmgr.core.AppContext;
import com.dexcoder.dal.JdbcDao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by signheart on 2016/9/23.
 */
public class AreaUtil {

    private JdbcDao jdbcDao;

    public AreaUtil(){
        jdbcDao = (JdbcDao) AppContext.getSpringContext().getBean("jdbcDao");
    }

    private static AreaUtil areaUtil;


    public static synchronized AreaUtil getInstance() {
        if(areaUtil == null) {
            try {
                areaUtil = new AreaUtil();
            }finally {

            }
        }

        return areaUtil;
    }

    private Map<String,ArrayList> areaMap;




    public String getAreaListJson() throws Exception {
        if(null==areaMap){
            areaMap = new HashMap<>();
            List<AreaVO> list = jdbcDao.queryList(new AreaVO());
            for (AreaVO areaVO:list){
                String areatext = areaVO.getAreatext();
                String[] areastrs = areatext.split(",");
                ArrayList realareatext = new ArrayList();
                for (int i =0;i<areastrs.length;i++){
                    if(!ValidateUtil.isNullOrBlank(areastrs[i].trim())){
                        String str = areastrs[i].trim().replaceAll(" ","").replaceAll("　","");
                        realareatext.add(str);
                    }
                }
                areaMap.put(areaVO.getCity(),realareatext);
            }
        }
        return JsonUtil.toJson(areaMap);

    }


}
