var calc = {
	/*
	 * 函数，加法函数，用来得到精确的加法结果
	 * 说明：javascript的加法结果会有误差，在两个浮点数相加的时候会比较明显。这个函数返回较为精确的加法结果。
	 * 参数：arg1：第一个加数；arg2第二个加数；d要保留的小数位数（可以不传此参数，如果不传则不处理小数位数）
	 * 调用：calc.Add(arg1,arg2,d) 返回值：两数相加的结果
	 */
	Add : function(arg1, arg2) {
		arg1 = arg1.toString(), arg2 = arg2.toString();
		var arg1Arr = arg1.split("."), arg2Arr = arg2.split("."), d1 = arg1Arr.length == 2 ? arg1Arr[1]
				: "", d2 = arg2Arr.length == 2 ? arg2Arr[1] : "";
		var maxLen = Math.max(d1.length, d2.length);
		var m = Math.pow(10, maxLen);
		var result = Number(((arg1 * m + arg2 * m) / m).toFixed(maxLen));
		var d = arguments[2];
		return typeof d === "number" ? result.toFixed(d)
				: result.toFixed(2);
	},
	/*
	 * 函数：减法函数，用来得到精确的减法结果 说明：函数返回较为精确的减法结果。
	 * 参数：arg1：第一个加数；arg2第二个加数；d要保留的小数位数（可以不传此参数，如果不传则不处理小数位数
	 * 调用：calc.Sub(arg1,arg2) 返回值：两数相减的结果
	 */
	Sub : function(arg1, arg2) {
		return calc.Add(arg1, -Number(arg2), arguments[2]);
	},
	/*
	 * 函数：乘法函数，用来得到精确的乘法结果 说明：函数返回较为精确的乘法结果。
	 * 参数：arg1：第一个乘数；arg2第二个乘数；d要保留的小数位数（可以不传此参数，如果不传则不处理小数位数)
	 * 调用：calc.Mul(arg1,arg2) 返回值：两数相乘的结果
	 */
	Mul : function(arg1, arg2) {
		var r1 = arg1.toString(), r2 = arg2.toString(), m, resultVal, d = arguments[2];
		m = (r1.split(".")[1] ? r1.split(".")[1].length : 0)
				+ (r2.split(".")[1] ? r2.split(".")[1].length : 0);
		resultVal = Number(r1.replace(".", "")) * Number(r2.replace(".", ""))
				/ Math.pow(10, m);
		return typeof d !== "number" ? resultVal.toFixed(2)
				: resultVal.toFixed(parseInt(d));
	},
	/*
	 * 函数：除法函数，用来得到精确的除法结果 说明：函数返回较为精确的除法结果。
	 * 参数：arg1：除数；arg2被除数；d要保留的小数位数（可以不传此参数，如果不传则不处理小数位数) 调用：calc.Div(arg1,arg2)
	 * 返回值：arg1除于arg2的结果
	 */
	Div : function(arg1, arg2) {
		var r1 = arg1.toString(), r2 = arg2.toString(), m, resultVal, d = arguments[2];
		m = (r2.split(".")[1] ? r2.split(".")[1].length : 0)
				- (r1.split(".")[1] ? r1.split(".")[1].length : 0);
		resultVal = Number(r1.replace(".", "")) / Number(r2.replace(".", ""))
				* Math.pow(10, m);
		return typeof d !== "number" ? resultVal.toFixed(2)
				: resultVal.toFixed(parseInt(d));
	}
};