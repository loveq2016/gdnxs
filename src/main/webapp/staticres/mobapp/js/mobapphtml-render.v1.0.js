/**
 * @required jquery Created by ki_tom on 16/3/15. 支持: select标签: 后台数据格式:
 *           {data:[{}]}
 * data-src: 数据地址,支持远程url;本地对象数据,格式为:"local:js对象"
 *data-filed: 数据源字段 data:[{}]
 * remote-method: 远程调用协议[post/get...]
 * item-text:显示的文本 item-value:option对应的值
 * dict-type:字典类型代码
 * default-value:默认选中的值
 * view-show:将值设置在text中
 */

$(function() {
	$('[dict-type]').each(
			function() {
				var self = $(this);
				// 全局字典处理[当前只实现:select]
				var dictType = self.attr('dict-type');
				if (dictType) {
					createSelect(dictJson.data,
							dictType, self);
				}
			});
	/** ************非字典处理**************** */
	$('[data-src]').each(function() {
		var self = $(this);
		var url = self.attr('data-src');
		var flag = self.attr('whether');//是否调用分页查询的方法;
		var data_src_field = self.attr('data-field')||'data';
		var method = self.attr("remote-method");
		// 本地数据源
		var data;
		if (url.indexOf('local:') > -1) {
			try {
				data = eval(url.substr(url.indexOf(":") + 1, url.length));
				renderHtml(data, self,false);
			} catch (e) {
				return;
			}
			return;
		}
		// 远程数据源
		$.ajax({
			url : url,
			method : method||"post",
			data : {
				_csrf : token,
				'limit' : '100000'
			},
			dataType : "json",
			async : false,
			success : function(res) {
				if (!res || !res[data_src_field])
					return;
				renderHtml(res[data_src_field], self, flag);
			}
		});
	});

	/**
	 * 渲染页面标签 data-src
	 * 
	 * @param result
	 *            本地或者远程数据,格式:[{}]
	 * @param self
	 *            当前操作的jquery对象
	 * @param flag 是否调用分页查询的方法
	 */
	function renderHtml(result, self, flag) {
		var data;
		if(flag){
			data = result.rows;
		}else{
			data = result;
		}
		console.info(data);
		var defaultValue = self.attr('default-value');
		var defaultText = "";
		if (self[0].tagName == 'SELECT') {
			self.append("<option value=''>请选择</option>");

			for ( var i = 0; i < data.length; i++) {
				var _value = data[i][self.attr('item-value')];
				var text = data[i][self.attr('item-text')];
				self.append("<option value='" + _value + "'>" + text
						+ "</option>")
			}
			self.val(defaultValue);

		} else if (self.attr("view-show") != undefined) {

			for ( var i = 0; i < data.length; i++) {
				var _value = data[i][self.attr('item-value')];
				var text = data[i][self.attr('item-text')];
				if (_value == defaultValue) {
					defaultText = text;
					break;
				}
			}
			self.text(defaultText);
		}
	}
	/**
	 * 渲染页面标签 dict-type
	 * 
	 * @param data
	 *            本地或者远程数据,格式:[{}]
	 * @param dictType
	 *            字典类型码
	 * @param self
	 *            当前操作的jquery对象
	 */
	function createSelect(data, dictType, self) {
		var defaultValue = self.attr('default-value');
		var defaultText = "";
		// console.info(self.attr("view-show")!=undefined);
		if (self[0].tagName == 'SELECT') {
			self.empty();
			self.append("<option value=''>请选择</option>");
			// console.info(data);
			// console.info(dictType);
			for ( var i = 0; i < data.length; i++) {
				// console.info(data[i]["dictType"]);
				if (data[i]['dictType'] == dictType && data[i]['itemCode'])
					self.append("<option value='" + data[i]['itemCode'] + "'>"
							+ data[i]['itemCodeDesc'] + "</option>")
			}
			self.val(defaultValue);

		} else if (self.attr("view-show") != undefined) {
			for ( var i = 0; i < data.length; i++) {
				var _value = data[i]['itemCode'];
				var text = data[i]['itemCodeDesc'];
				if (data[i]['dictType'] == dictType
						&& data[i]['itemCode'] == defaultValue) {
					defaultText = text;
					break;
				}
			}
			self.text(defaultText);
		}
		// console.info(defaultText);
	}
});
