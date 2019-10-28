
var commonFunction = {
	str_zodiac:["","鼠","牛","虎","兔","龙","蛇","马","羊","猴","鸡","狗","猪"],
	str_wave:["","红波","蓝波","绿波"],
	str_wave_single:["","红","蓝","绿"],
	str_wave_color:["","red","blue","green"],
	str_five:["","金","木","水","火","土"],
	dateToString:function(val){
		var valDate = new Date(val);
		var defaultPattern = "yyyy-MM-dd hh:mm:ss";
		if(arguments[1] && arguments[1].length>0){
			defaultPattern = arguments[1];
		}
		return valDate.format(defaultPattern);
	},
	split:function(val,splitChar){
		return val.split(splitChar);
	}
};

Date.prototype.format = function(format) {
   var weeks = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
   var date = {
          "M+": this.getMonth() + 1,
          "d+": this.getDate(),
          "h+": this.getHours(),
          "m+": this.getMinutes(),
          "s+": this.getSeconds(),
          "q+": Math.floor((this.getMonth() + 3) / 3),
          "S+": this.getMilliseconds(),
          "W+":weeks[this.getDay()]
   };
   if (/(y+)/i.test(format)) {
          format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
   }
   for (var k in date) {
          if (new RegExp("(" + k + ")").test(format)) {
                 format = format.replace(RegExp.$1, RegExp.$1.length == 1
                        ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
          }
   }
   return format;
}

define(["jquery","text","css",'tmpl'],function($,text,css){
	$.fn.loadTmpl = function(options,callback){
		if($("script#"+options.id).length==0){
			require(['text!'+options.path],function(srcCode){
				srcCode = '<script  id="'+options.id+'" type="text/x-jquery-tmpl">'+srcCode+'<\/script>';
				$("body").append(srcCode);
				if(typeof(callback)=="function"){
					callback(options);
				}
			});
		}else{
			if(typeof(callback)=="function"){
				callback(options);
			}
		}		
	}

	
	$(document).ready(function(){
		$(".__html_module").each(function(index,elem){
			var tmplSrc = $(this).data("tmpl");
			if(tmplSrc && tmplSrc.length>0){}else{
				return;
			}
			$(this).load(tmplSrc,function(){});
		});
		//根据标签默认去加载一些简单的模块
		//<div id="必填" class="__data_module" data-scriptid="[moduleid]" data-url="" data-tmpl="src/gamedraw/list" data-module="history/list" 
		//data-method="appendTo|prependTo|insertBefore|replaceAll"></div>
		$(".__data_module").each(function(index,elem){
			var now = new Date();
			var divid = $(this).attr("id");
			if(divid && divid.length>0){

			}else{
				divid = "scriptid"+now.getTime()
				$(this).attr("id",divid);
			}
			var remotePath = $(this).data("url");
			var tmplSrc = $(this).data("tmpl");
			if(remotePath && remotePath.length>0 && tmplSrc && tmplSrc.length>0){}else{
				return;
			}
			var scriptId = $(this).data("scriptid")?$(this).data("scriptid"):"scriptid"+now.getTime();
			var divAction = $(this).data("method")?$(this).data("method"):"appendTo";
			switch(divAction.trim().toLowerCase()){
				case "appendto":
					divAction = "appendTo";
				break;
				case "prependto":
					divAction = "prependTo";
				break;
				case "insertbefore":
					divAction = "insertBefore";
				break;
				case "replaceall":
					divAction = "replaceAll";
				break;
				default:
					divAction = "appendTo";
				break;
			}
			remotePath = rserver+"/"+remotePath;
			remotePath = remotePath.replace(/\s+/ig,"");
			remotePath = remotePath.replace(/\/+/ig,"/");
			if(remotePath.indexOf("https:/")>=0){
				remotePath = remotePath.replace(/(https:)\//,"https://");
			}
			if(remotePath.indexOf("http:/")>=0){
				remotePath = remotePath.replace(/(http:)\//,"http://");
			}
			$(this).loadTmpl({path:tmplSrc,id:scriptId,divid:divid},function(options){
				$.ajax({
					url:remotePath,
					dataType:"jsonp",
					success:function(respData, textStatus, jqXHR){
						//console.log(respData);
						var resetData = {data:respData};
						if(divAction=="appendTo"){
							$("script#"+options.id).tmpl(resetData,commonFunction).appendTo("#"+options.divid);
						}
						if(divAction=="prependTo"){
							$("script#"+options.id).tmpl(resetData,commonFunction).prependTo("#"+options.divid);
						}
						if(divAction=="insertBefore"){
							$("script#"+options.id).tmpl(resetData,commonFunction).insertBefore("#"+options.divid);
						}
						if(divAction=="replaceAll"){
							$("script#"+options.id).tmpl(resetData,commonFunction).replaceAll("#"+options.divid);
						}
					},
					error:function(XMLHttpRequest, textStatus, errorThrown){},
					complete:function(XMLHttpRequest, textStatus){}
				});
			})
			
		});
	});
});
