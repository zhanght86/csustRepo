<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>资源管理系统--公告管理</title>
<%@include file="/admin/head.jsp"%>
<%@include file="/admin/thirdpartinclude.jsp"%>
<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content"]', {
				cssPath : '../../thirdparty/kindeditor/plugins/code/prettify.css',
				uploadJson : '../../thirdparty/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '../../thirdparty/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true
			});
			prettyPrint();
		K('#add-picture').click(function () {
	            var topimg = $("#topimg");
	            editor1.loadPlugin('image', function () {
	                editor1.plugin.imageDialog({
	                    clickFn: function (url, title, width, height, border, align) {
	                        var div = K('#topimgdiv');
	                        div.html("");
	                        div.append('<div style=\"float:left;width:60px;\"><div><img style=\"height:100px;width:100px;\" src="' + url + '" title="' + title + '" /></div><div><a href=\"javascript:delimg()\">删除</a></div></div>');
							topimg.val(url);
	                        editor1.hideDialog();
	                    }
	                });
	            });
	        });
		});
		$(function() {
			$("#jvForm").validate();
			
						
			
		      Calendar.setup({
		        inputField : "atime",
		        trigger    : "atime",
		        showTime   : true,
		        dateFormat : "%Y-%m-%d %H:%M:%S",
		        //align :"bottom",
		    	onSelect   : function() {  },onTimeChange  : function(cal) {	var h = cal.getHours(), m = cal.getMinutes(); if (h < 10) h = "0" + h; if (m < 10) m = "0" + m; cal.inputField.value=cal.date.getFullYear()+"-"+(cal.date.getMonth()+1)+"-"+(cal.date.getDate())+" "+h+":"+m+":00"; }
		      });
			
		});
</script>
</head>

<body>
<iframe name="hiddenIframe" frameborder="0" border="0" style="display:none;width:0px;height:0px;"></iframe>
<div class="box-positon">
	<div class="rpos">当前位置: 公告管理 - 编辑</div>
	<form class="ropt">
		<input type="submit" value="返回列表" onclick="this.form.action='notice_list.do';" class="return-button" />
	</form>
	<div class="clear"></div>
</div>

<div class="body-box">
<form method="post" action="notice_update.do" id="jvForm">
<input type="hidden" name="id" value="<s:property value="id" />" />
<table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">

	<tr id="tr-title">
		<td width="10%" class="pn-flabel pn-flabel-h"><span class="pn-frequired">*</span>标题:</td>
		<td colspan="3" width="90%" class="pn-fcontent">
			<input type="text" maxlength="150" name="title" value="<s:property value='title'/>" class="required"/>
		<font color="red"><s:property value='#message' /></font>
		</td>
	</tr>
	
	<tr id="tr-author">
		<td width="10%" class="pn-flabel pn-flabel-h">作者:</td>
		<td colspan="3" width="40%" class="pn-fcontent">
			<input type="text" maxlength="100" name="author" value="<s:property value='author'/>" maxlength="100" />
		</td>
	</tr>
	
	<tr>	
	<td width="10%" class="pn-flabel pn-flabel-h">是否发布:</td>
	<td width="40%" class="pn-fcontent">
		<label><input type="radio" value="1" <s:property value='#params==null?"checked=checked":""' /> <s:property value='ispassed=="1"?"checked=checked":""' /> name="ispassed" />发布</label>
		<label><input type="radio" value="0" name="ispassed" <s:property value='ispassed==0?"checked=checked":""' />/>未发布</label> 
	</td>
	</tr>	
	
	<tr id="tr-topLevel">
		<td colspan="1" width="10%" class="pn-flabel pn-flabel-h">发布时间:</td>
		<td colspan="3" width="90%" class="pn-fcontent">
		<input class="Wdate" type="text" 
				id="atime"
				style="width: 140px" name="atime" 
				value="<s:if test="addtime!=null"><s:date name="addtime" format="yyyy-MM-dd HH:mm:ss" /></s:if>"> 
			<span class="pn-fhelp">留空则为当前时间</span>
		</td>
	</tr>
	
	<tr id="tr-txt">
		<td class="pn-flabel pn-flabel-h" width="10%">内容:</td>
		<td colspan="3" width="90%" class="pn-fcontent">
			<textarea class="ckeditor" cols="100" rows="20" id="content" name="content"><s:property value="content"/></textarea>
		</td>
	</tr>

	<tr>
		<td colspan="4" class="pn-fbutton">
		<input type="hidden" name="cid" value="11" /> 
		<input type="submit" value="提交" class="submit" class="submit" />&nbsp; 
		<input type="reset" value="重置" class="reset" class="reset" onclick="javascript:window.location.href='notice_edit.do?id=<s:property value="id" />'"/>
		</td>
	</tr>
			</table>
		</form>
	</div>
</body>
</html>