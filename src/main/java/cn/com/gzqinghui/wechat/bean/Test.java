package cn.com.gzqinghui.wechat.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

public class Test {
	
	public static void main(String[] args) {
		Button t1 = new Button();
		Button t2 = new Button();
		Button t3 = new Button();
		List<Button> list = new ArrayList<Button>();
		List<Button> list1 = new ArrayList<Button>();
		
		t1.setKey("rselfmenu_0_0");
		t1.setName("一级菜单");
		t1.setType("click");
		
		t2.setUrl("V1001_TODAY_MUSIC");
		t2.setName("今日歌曲");
		t2.setType("view");
		
		t3.setName("有二级");
		list1.add(t1);
		list1.add(t2);
		t3.setSub_button(list1);
		
		Map<String,Object> map = new HashMap<String, Object>();
		list.add(t1);
		list.add(t2);
		list.add(t3);
		map.put("button", list);
		Gson gson = new Gson();
		String str = gson.toJson(map);
		System.out.println(str);
	}
}
