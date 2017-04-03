/*var keyFlag = 0;

var map;
var devices = new Array();
$(function() {
	// 菜单
	loadMenu();
	// 报警数和用户名
	getMessageCountAndName();
	// 加载地图
	loadMap();
	// 获取所有设备
	getZone();
	// 获取热键菜单lin20161107
	selectHotkeyMenu();

});

// 加载菜单
function loadMenu() {
	$(".sidebar_menu").empty();
	var timestamp = new Date().getTime();
	var checksum = "1";
	$
			.ajax({
				type : "GET",
				url : rURL + "/menus/selectMenu2",
				 url : baseURL + "/menus/selectMenu",
				data : {
					userId : userId,
					timestamp : timestamp,
					checksum : checksum,
					userid : userid
				},
				dataType : "json",
				success : function(data) {
					if (data.code == 1) {
						if (data.rows.length > 0) {
							for (var i = 0; i < data.rows.length; i++) {
								var picture = '';
								if (data.rows[i].cdid == 'search') {
									picture = '/images/ico_query.png'
								}
								if (data.rows[i].cdid == 'analyze') {
									picture = '/images/data_analysis.png'
								}
								if (data.rows[i].cdid == 'monitor') {
									picture = '/images/control_settings.png'
								}
								if (data.rows[i].cdid == 'placesAndDevices') {
									picture = '/images/place_equipment.png'
								}
								if (data.rows[i].cdid == 'statistics') {
									picture = '/images/info_statistics.png'
								}
								if (data.rows[i].cdid == 'users') {
									picture = '/images/xtgl.png'
								}
								var image = baseURL + picture;
								if (data.rows[i].menuList
										&& data.rows[i].menuList.length > 0) {
									var html = '<li class="treeview"><a href="javascript:;"><img src= "'
											+ image
											+ '">'
											+ data.rows[i].cdmc
											+ '<s class="iGuide"></s></a>'
											+ '<ul class="treeview_menu">'
									for (var j = 0; data.rows[i].menuList
											&& j < data.rows[i].menuList.length; j++) {
										var hf = baseURL
												+ data.rows[i].menuList[j].localUrl;
										html = html
												+ '<li><a href="javascript:;" hf="'
												+ hf + '" rel="' + i + '' + j
												+ '">'
												+ data.rows[i].menuList[j].cdmc
												+ '</a></li>'
									}
									+'</ul></li>'
									$(".sidebar_menu").append(html);
								}
							}
						}
					}
				}
			});
}

function loadMap() {
	var html = "";
	html += '<div class="home_page" >'
			+ '共<span id="index_sb_total">0</span>台设备 <i class="normal_round"></i>正常'
			+ '<span id="index_sb_devicesNormal">0</span>台 <i '
			+ 'class="abnormal_round"></i>异常<span id="index_sb_devicesError">0</span>台'
			+ '</div>'

	var header_bar = $("<div>").attr({
		id : "header_bar",
	}).css({
		height : "75px"
	}).html(html);

	var main_content = $("<div>").attr({
		id : "main_content",
	}).css({
		height : "90%"
	});

	$('#content').append(header_bar).append(main_content);
	map = new BMap.Map("main_content");
	var location = new BMap.Point(116.63323, 23.68522);
	map.centerAndZoom(location, 15);
	map.addControl(new BMap.NavigationControl());
	map.addControl(new BMap.OverviewMapControl());
	map.addControl(new BMap.MapTypeControl({
		mapTypes : [ BMAP_NORMAL_MAP, BMAP_HYBRID_MAP ]
	}));
	map.addControl(new BMap.ScaleControl({
		offset : new BMap.Size(20, 2),
		anchor : BMAP_ANCHOR_BOTTOM_RIGHT
	}));

	map.enableScrollWheelZoom();
	map.enableInertialDragging();
	map.enableContinuousZoom();
}

function func() {
	var point = this.getPosition();
	var mark = this;
	$.each(devices, function(i, item) {
		var device = transform(item.lon, item.lat);
		if (device.lng == point.lng && device.lat == point.lat) {
			var infoWindow2 = new BMap.InfoWindow(htmlModal(item));
			mark.openInfoWindow(infoWindow2);
		}
	});
}

function htmlModal(item) {
	var point = transform(item.lon, item.lat);
	var html = '<p class="htmlModal">设备编号：' + item.deviceid + '</p>';
	html += '<p  class="htmlModal">设备名称：' + item.devicename + '</p>';
	html += '<p  class="htmlModal">设备地址：' + item.address + '</p>';
	html += '<p  class="htmlModal">设备经纬度：' + point.lng.toFixed(6) + ' , '
			+ point.lat.toFixed(6) + '</p>';
	if (item.sbzt == '正常') {
		html += '<p style="color:#0f0"  class="htmlModal">设备状态：' + item.sbzt
				+ '</p>';
	} else if (item.sbzt == '故障') {
		html += '<p style="color:#f00"  class="htmlModal">设备状态：' + item.sbzt
				+ '</p>';
	} else {
		html += '<p style="color:#ccc"  class="htmlModal">设备状态：' + item.sbzt
				+ '</p>';
	}
	return html;
}

function getZone() {
	var timestamp = new Date().getTime();
	var checksum = "";
	$.ajax({
		type : "GET",
		url : rURL + "/zones/search",
		data : {
			userId : userId,
			timestamp : timestamp,
			checksum : checksum,
			words : null,
			status : null
		},
		dataType : "json",
		success : function(data) {
			if (data.code == 1) {
				mapData(data);
			}
		}
	});
}

function mapData(datas) {
	var devicesNormal = 0;
	var devicesError = 0;
	var devicesOffline = 0;
	var xMin = 1000, yMin = 1000, xMax = -1000, yMax = -1000;
	map.clearOverlays();
	var allPionts = new Array();
	for (var i = 0; i < datas.rows.length; i++) {
		if (datas.rows[i].sbzt == "正常") {
			devicesNormal++;
		} else if (datas.rows[i].sbzt == "故障") {
			devicesError++;
		} else if (datas.rows[i].sbzt == "离线") {
			devicesOffline++;
		}
		var transformResult = transform(datas.rows[i].lon, datas.rows[i].lat);
		if (transformResult.lng > xMax)
			xMax = transformResult.lng;
		if (transformResult.lat > yMax)
			yMax = transformResult.lat;
		if (transformResult.lng < xMin)
			xMin = transformResult.lng;
		if (transformResult.lat < yMin)
			yMin = transformResult.lat;
		var imgUrl = baseURL + "/images/u19.png";
		if (datas.rows[i].sbzt == "故障") {
			imgUrl = baseURL + "/images/u40.png";
		} else if (datas.rows[i].sbzt == "离线") {
			imgUrl = baseURL + "/images/u41.png";
		}
		var myIcon = new BMap.Icon(imgUrl, new BMap.Size(20, 20), {
			imageSize : new BMap.Size(20, 20)
		});
		var marker = new BMap.Marker(new BMap.Point(transformResult.lng,
				transformResult.lat), {
			title : datas.rows[i].devicename,
			icon : myIcon
		});
		marker.addEventListener('click', func);
		map.addOverlay(marker);
		devices[i] = datas.rows[i];
		allPionts[i] = new BMap.Point(transformResult.lng, transformResult.lat);
		$("#index_sb_total").html(datas.rows.length);
		$("#index_sb_devicesNormal").html(devicesNormal);
		$("#index_sb_devicesError").html(devicesError);
	}
	map.addEventListener("zoomend", function() {
		var DiTu = map.getZoom();// 获取 级别
		if (DiTu < 15) {
			heatMap();
		} else if (DiTu >= 15) {
			mapData(datas);
		}
	});

	// map.setViewport(allPionts);
}

function transform(lon, lat) {
	return window.transformFromWGS84ToBaidu(parseFloat(lon), parseFloat(lat));
}

function heatMap() {
	if (!pointList) {
		$.ajax({
			type : 'post',
			url : rURL + '/placeAndDevices/heatMapDevice',
			async : false,
			data : {
				date : ''
			},
			timeout : 2000,
			error : function() {

			},
			success : function(points) {
				pointList = points;
			}
		});
	}
	tramsformData(pointList);
}

// 转化数据
function tramsformData(points){
	if (!isSupportCanvas()) {
		$.msg.toast('热力图目前只支持有canvas支持的浏览器,您所使用的浏览器不能使用热力图功能~')
	}
	// 详细的参数,可以查看heatmap.js的文档
	// https://github.com/pa7/heatmap.js/blob/master/README.md

	// 参数说明如下:
	
	 * visible 热力图是否显示,默认为true opacity 热力的透明度,1-100 radius 势力图的每个点的半径大小 gradient
	 * {JSON} 热力图的渐变区间 . gradient如下所示 { .2:'rgb(0, 255, 255)', .5:'rgb(0, 110,
	 * 255)', .8:'rgb(100, 0, 255)' } 其中 key 表示插值的位置, 0~1. value 为颜色值.
	 
	heatmapOverlay = new BMapLib.HeatmapOverlay({
		"radius" : 20
	});
	map.clearOverlays();
	map.addOverlay(heatmapOverlay);
	heatmapOverlay.setDataSet({
		data : points,
		max : 1
	});
	// 是否显示热力图

	function openHeatmap() {
		heatmapOverlay.show();
	}

	function closeHeatmap() {
		heatmapOverlay.hide();
	}

	openHeatmap();

	function setGradient() {
		
		 * 格式如下所示: { 0:'rgb(102, 255, 0)', .5:'rgb(255, 170, 0)', 1:'rgb(255, 0, 0)' }
		 
		var gradient = {};
		var colors = document.querySelectorAll("input[type='color']");
		colors = [].slice.call(colors, 0);
		colors.forEach(function(ele) {
			gradient[ele.getAttribute("data-key")] = ele.value;
		});
		heatmapOverlay.setOptions({
			"gradient" : gradient
		});
	}

	function isSupportCanvas() {
		var elem = document.createElement('canvas');
		return !!(elem.getContext && elem.getContext('2d'));
	}

}


// 报警数
function getMessageCountAndName() {
	var timestamp = new Date().getTime();
	var checksum = "";
	$.ajax({
		type : "GET",
		url : rURL + "/warning/countWarning",
		data : {
			userId : 2,
			timestamp : timestamp,
			checksum : checksum,
		},
		dataType : "json",
		success : function(data) {
			$("#index_warning_total").html(data.total);
		}
	});
	var sStorage = window.sessionStorage;
	var user = JSON.parse(sStorage.getItem("user"))
	if (user) {
		var userName = user['userName'];
		var userId = user['userId'];
		if (userName) {
			$(".login_account").html("您好：" + userName + "");
		}
	}

}
// 显示报警消息列表
function showWarningList(obj) {
	addTab($(obj));

	var _width = $(".content_tabs").width();
	var _li_width = $("#tabs li").width();
	var num = $("#tabs li").size();
	var margin_r = $(".content_tabs").width() * 0.002;
	var total_width = (margin_r + _li_width) * num;

	if (total_width > _width) {
		var per = 100 / num;
		$("#tabs li").width((per - 0.2 - 2) + "%");
	}
}

function addTab(link) {
	debugger;
	// If tab already exist in the list, return
	if ($("#" + $(link).attr("rel")).length != 0)
		return;

	// hide other tabs
	$("#tabs li").removeClass("current");
	$("#content iframe").hide();
	$("#content #header_bar, #content #main_content").hide();
	// add new tab and related content
	$("#tabs").append(
			"<li class='current'><a class='tab' id='" + $(link).attr("rel")
					+ "' href='#'>" + '报警消息'
					+ "</a><a href='#' class='remove'>x</a></li>");
	var iframe_content = '<iframe id="'
			+ $(link).attr("rel")
			+ '_content" height="100%" border="0" style="border:0; "  width="100%" src="'
			+ $(link).attr("hf") + '">';
	$("#content").append(iframe_content);

	// set the newly added tab as current
	$("#" + $(link).attr("rel") + "_content").show();
	debugger;
}

// 根据用户id查询该用户的热键菜单
function selectHotkeyMenu() {
	// 时间戳
	var sStorage = window.sessionStorage;
	var user = JSON.parse(sStorage.getItem("user"))
	var userid;
	if (user) {
		userid = user['systemid'];
	}
	var timestamp = new Date().getTime();
	var checksum = '';
	$('.wifi_bomb_list').empty();
	$
			.ajax({
				type : "GET",
				url : rURL + "/hotkey/selectHotkeyMenu",
				data : {
					userId : userId,
					timestamp : timestamp,
					checksum : checksum,
					userid : userid,
				},
				dataType : "json",
				success : function(rs) {
					for (var i = 0; i < rs.rows.length; i++) {

						var html = '<div class="wifi_bomb_box_con" onclick="openMenu(\''
								+ rs.rows[i].cdmc
								+ '\')">'
								+ rs.rows[i].cdmc
								+ '<a href="javascript:;" class="bomb_box_delete" style="margin-top: 10px;" onclick="deleteHotkeyMenu(\''
								+ rs.rows[i].id
								+ '\'\,\''
								+ rs.rows[i].cdid
								+ '\')">'
								+ '<img src="'
								+ baseURL
								+ '/images/ico_delete_blue.png">'
								+ '</a></div>'

						$('.wifi_bomb_list').append(html);
					}
					$('.wifi_bomb_list').append(
							'<div style="clear: both;"></div>');
				}
			});
}

// 点击快捷菜单打开菜单
function openMenu(cdmc) {
	var flag = true;
	// 循环所有tab
	$("#tabs").find(".tab").each(function() {
		if ($(this).text() == cdmc) {
			$(this).click();
			flag = false;
		}
	});
	if (flag) {
		// 循环所有菜单功能
		$(".sidebar_menu").find(".treeview_menu a").each(function() {
			if (cdmc == $(this).text()) {
				$(this).parents(".treeview").children("a").click();
				$(this).click();
			}
		});
	}
}

// 加载可添加的快捷菜单
function loadHotKeyFunc(obj) {
	keyFlag++;
	if (keyFlag % 2 == 0) {
		$(obj).parent().find(".add_function").hide();
		return;
	}
	$(obj).parent().find(".add_function").show();

	$(".add_function").find("ul").empty();
	// 通过用户id查询一级菜单编码cdid
	var timestamp = new Date().getTime();
	var checksum = '';
	$.ajax({
		type : "GET",
		url : rURL + "/hotkey/selectHotkeyMenuByFunc",
		data : {
			userId : userId,
			timestamp : timestamp,
			checksum : checksum,
			userid : systemid
		},
		dataType : "json",
		success : function(rs) {
			console.log(rs);
			for (var i = 0; i < rs.rows.length; i++) {
				$(".add_function").find("ul").append(
						'<li onclick="aaa(event)"><input type="checkbox" value="'
								+ rs.rows[i].cdid + '">' + rs.rows[i].cdmc
								+ '</li>');
			}
		}
	});

}

function aaa(evt) {
	debugger;
	e = window.event || evt;// 兼容所有浏览器
	e.stopPropagation();
}

// 新增菜单热键
function addHotkeyMenu() {
	var sStorage = window.sessionStorage;
	var user = JSON.parse(sStorage.getItem("user"))
	var userid;
	if (user) {
		userid = user['systemid'];
	}
	var menuid = '';
	$(".add_function").find("input:checked").each(function(i) {
		menuid += $(this).val() + ',';
	});
	menuid = menuid.substring(0, (menuid.length - 1));
	var timestamp = new Date().getTime();
	var checksum = '';

	$.ajax({
		type : "POST",
		url : rURL + "/hotkey/addHotkeyMenu",
		data : {
			userId : userId,
			timestamp : timestamp,
			checksum : checksum,
			userid : userid,
			menuid : menuid
		},
		dataType : "json",
		success : function(rs) {
			if (rs.rows[0].result == true) {
				$.msg.success("添加成功！");
				selectHotkeyMenu();
			} else {
				$.msg.fail("添加失败！");
			}
		}
	});

}

// 删除菜单热键
function deleteHotkeyMenu(id, menuName) {
	var sStorage = window.sessionStorage;
	var user = JSON.parse(sStorage.getItem("user"))
	var userid;
	if (user) {
		userid = user['systemid'];
	}
	var menuid = '';
	var timestamp = new Date().getTime();
	var checksum = '';
	$.ajax({
		type : "POST",
		url : rURL + "/hotkey/deleteHotkeyMenu",
		data : {
			userId : userId,
			userSystemid : userid,
			timestamp : timestamp,
			checksum : checksum,
			menuName : menuName
		},
		dataType : "json",
		success : function(rs) {
			if (rs.rows[0].result == true) {
				$.msg.success("删除成功！");
				selectHotkeyMenu();
			} else {
				$.msg.fail("删除失败！");
			}
		}
	});

	var e = e || window.event;
	e.stopPropagation();

}


 */

// 退出登录
function logout() {

	var data = eval("({'_csrf':'" + token + "'})");
	$.ajax({
		type:"POST",
		url:baseURL+'/j_spring_security_logout',
		data: data,
		success: function(msg) {
			parent.window.location.replace("")
		}
	});
}

// 修改密码
function modifyPassword() {
	// if($('#password_editform').size()>0)return;
	// 编辑
	var timestamp = new Date().getTime();
	var checksum = '5555';
	$.dialog.addoredit({
		title : "修改用户密码",
		url : baseURL + "/jsp/user/password_edit.jsp?" + _csrf + "=" + token,
		afterloaded : function() {
		}
		// 修改事件
		,
		confirmcallback : function() {
			if ($("#edit_password").val() != $("#edit_password2").val()) {
					$("#edit_password").inputError("两次输入密码不一致");
					$("#edit_password2").inputError("两次输入密码不一致");
				return false
			}
			if (!$('#password_editform').valid())
				return false;
			$('#password_editform').attr('action',baseURL+"/usermanage/updatePassword");
			//

			$('#password_editform').ajaxSubmit({
				dataType : 'json',
				data : {
					'id' : userId,
					'timestamp' : timestamp,
					'checksum' : checksum,
					'_csrf' : token
				},
				success : function(result) {
					if ( result.success==true) {
						$.msg.success('修改密码成功');
						$(".modal-footer .btn-danger").trigger("click");
						logout();
					} else {
						$.msg.fail('修改密码失败');
						return false;
					}
				},
				error : function() {
					$.msg.fail('修改密码失败，可能是由网络原因引起的，请稍候再试');
					return false;
				}
			});
			return false;
		}
	})
}
