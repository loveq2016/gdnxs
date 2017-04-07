package cn.com.gzqinghui.common.util;

import cn.com.gzqinghui.sysmgr.common.util.DateUtil;
import cn.com.gzqinghui.sysmgr.core.AppContext;
import cn.com.gzqinghui.sysmgr.dict.service.IDictService;
import cn.com.gzqinghui.sysmgr.dict.vo.DictVO;
import org.apache.poi.hssf.usermodel.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by signheart on 2016/9/23.
 */
public class DictUtil {


    public  static List<DictVO> dictlist = new ArrayList();

    static {
        if(dictlist.size()<=0){
            IDictService dictService = (IDictService) AppContext.getSpringContext().getBean("dictService");
            DictVO dictVO = new DictVO();
            dictVO.setIsDel("0");
            try {
                dictlist = dictService.queryList(dictVO);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }



    public  static String  getDictValue(String type,String key) throws Exception {
        for(DictVO dictVO:dictlist){
            if(dictVO.getDictType().equalsIgnoreCase(type) && null!=dictVO.getParentId()){
                if(dictVO.getItemCode().equalsIgnoreCase(key)){
                    return dictVO.getItemCodeDesc();
                }
            }
        }
        return null;

    }



}
