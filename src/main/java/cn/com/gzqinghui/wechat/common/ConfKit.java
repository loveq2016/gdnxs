package cn.com.gzqinghui.wechat.common;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.InputStreamReader;
import java.util.Properties;

/**
 * 配置文件
 * @author ao.ouyang
 */
public class ConfKit {
	private final static Logger logger = LoggerFactory.getLogger(ConfKit.class);

	static Properties props;
	 static{
		 InputStreamReader is = null;
		 try {
			is = new InputStreamReader(ConfKit.class.getResourceAsStream("../resource/wechat.properties"), "UTF-8");
			props = new Properties();
			props.load(is);
			is.close();
		 } catch (Exception e) {
			logger.error(e.getMessage(), e);
		}finally {
			 IOUtils.closeQuietly(is);
		 }
	 }

	public static String get(String key) {
		return StringUtils.trim(props.getProperty(key));
	}

    public static void setProps(Properties p){
        props = p;
    }
}
