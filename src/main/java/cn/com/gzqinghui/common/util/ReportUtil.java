package cn.com.gzqinghui.common.util;

import cn.com.gzqinghui.sysmgr.common.util.DateUtil;
import org.apache.poi.hssf.usermodel.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by signheart on 2016/9/23.
 */
public class ReportUtil {
    private static final Logger log = LoggerFactory.getLogger(ReportUtil.class);

    public static final String CACHE_NAME = "REPORT_CACHE";


    /*public static void pageCache(List cacheList,Pager pager) throws Exception, BaseException {
        List pageList = cacheList.subList(Long.valueOf(pager.getCurrentPage()-1).intValue()*pager.getPageSize(),((Long.valueOf(pager.getCurrentPage()).intValue())*pager.getPageSize())>cacheList.size()?cacheList.size():((Long.valueOf(pager.getCurrentPage()).intValue())*pager.getPageSize()));
        pager.setTotalRows(cacheList.size());
        pager.setPageData(pageList);
    }


    public static void pageCache(String key,Pager pager) throws Exception, BaseException {
        List cacheList = null;
        if(null!= EhcacheUtil.getInstance().get(CACHE_NAME, key)){
            cacheList = (List) EhcacheUtil.getInstance().get(CACHE_NAME, key);
        }
        List pageList = cacheList.subList(Long.valueOf(pager.getCurrentPage()-1).intValue()*pager.getPageSize(),((Long.valueOf(pager.getCurrentPage()).intValue())*pager.getPageSize())>cacheList.size()?cacheList.size():((Long.valueOf(pager.getCurrentPage()).intValue())*pager.getPageSize()));
        pager.setTotalRows(cacheList.size());
        pager.setPageData(pageList);
    }*/



    public static File exportForExcel(String[] headers,String[] headerstext, List list) {
        String fileName = "exportForExcel.xls";
        File file = new File(fileName);
        FileOutputStream out = null;

        try {
            out = new FileOutputStream(file);
            HSSFWorkbook e = new HSSFWorkbook();
            HSSFSheet sheet = e.createSheet("Sheet1");
            int startRow = 0;
            HSSFRow row = sheet.createRow(startRow);
            startRow ++;
            HSSFCell cell = null;
            HSSFCellStyle style = e.createCellStyle();
            style.setAlignment((short)2);
            for(int field = 0; field < headers.length; ++field) {
                cell = row.createCell(field);
                cell.setCellValue(headerstext[field]);
            }

            for(int rowi = 0;rowi < list.size();rowi++){
                Map rowMap = (Map) list.get(rowi);
                row = sheet.createRow(startRow + rowi);
                for (int rowv =0;rowv < headers.length;rowv++ ){
                    cell = row.createCell(rowv);
                    cell.setCellStyle(style);
                    if(rowv == 0){
                        cell.setCellValue(rowi+1);
                        continue;
                    }
                    Object val = rowMap.get(headers[rowv]);
                    if(val==null){
                    	cell.setCellValue("");
                    }
                    else if(val instanceof String) {
                        cell.setCellValue(val.toString());
                    } else if(val instanceof Double) {
                        cell.setCellValue(((Double)val).doubleValue());
                    } else if(val instanceof Integer) {
                        cell.setCellValue((double)((Integer)val).intValue());
                    } else if(val instanceof Float) {
                        cell.setCellValue((double)((Float)val).floatValue());
                    } else if(val instanceof Long) {
                        cell.setCellValue((double)((Long)val).longValue());
                    } else if(val instanceof Boolean) {
                        cell.setCellValue(((Boolean)val).booleanValue());
                    } else if(val instanceof Date | val instanceof java.sql.Date) {
                        cell.setCellValue(val.toString());
                    } else{
                        cell.setCellValue(val.toString());
                    }
                }

            }
            startRow = startRow+ list.size();

            row = sheet.createRow(startRow + 1);
            row.setHeightInPoints(20.0F);
            cell = row.createCell(1);
            cell.setCellValue("导出的记录总数:," + list.size() + ",该表导出日期：," + DateUtil.formartCurrentDate());
            e.write(out);

        } catch (Exception e) {
            e.printStackTrace();
            log.error(e.getMessage(),e);
        }finally {
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return file;
    }


}
