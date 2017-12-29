<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
  <head>
    <%@ include file="/public/head.jspf" %>
    <script type="text/javascript">
  	$(function(){
    		
    		//自定义验证方法向validatebox.defaults.rules中注册新函数
    		$.extend($.fn.validatebox.defaults.rules,{
    			//函数的名称:函数实现体（又是一个json对象，里面包括函数的实现，和错误消息设置）
    			format:{
    				//函数实现，如果返回为false，则验证失败
    				validator:function(value,param){
    					//获取当前文件的后缀名
    					var ext = value.substring(value.lastIndexOf('.')+1);
    					//获取支持的文件后缀名，然后比较
    					var arr = param[0].split(",");
    					for(var i=0;i<arr.length;i++){
    						if(ext==arr[i]){
    							return true;
    						}
    					}
    					return false;
    				},
    				//错误消息
    				message:'文件必须为{0}'
    			}
    		}); 
    		
    		var dg = parent.$("iframe[title='商品管理']").get(0).contentWindow.$("#dg");
    		var rows= dg.datagrid("getSelections");
    		//回显
    		$('#ff').form('load',{
				id:rows[0].id,
				name:rows[0].name,
				price:rows[0].price,				
				pic:rows[0].pic,
				remark:rows[0].remark,
				xremark:rows[0].xremark,
			});
    		
    		$("#cc").combobox({
				url:'category_query.action',
				valueField:'id',
				textField:'type',
				panelHeight:'auto',
				panelWidth:120,
				width:120,
				editable:false,
				required:true,
				missingMessage:'请选择所属类别'
			});
    		$("input[name=name]").validatebox({
    			required:true,
    			missingMessage:'请输入商品名称'
    		});
    		
    		$("input[name=price]").numberbox({
    			required:true,
    			missingMessage:'请输入商品价格',
    			min:0,
    			precision:2,
    			prefix:'$'
    		});
    		
    		$("input[name='fileImage.upload']").validatebox({
    			//required:true,
    			//missingMessage:'请上传商品图片',
    			//设置自定义方法
    			validType:"format['gif,jpg,jpeg,png']"
    		});
    		$("input[name='fileImage.upload']").change(function(){
    			var str = $("input[name='fileImage.upload']").val();
    			var arr=str.split('\\');//注split可以用字符或字符串分割 
    			var my=arr[arr.length-1];//这就是要取得的图片名称
    			$("#pic").val(my);
    		});
    		//当文件域内容发生变化时，调用验证方法（默认是单击提交时调用验证）
    		$("input[name=upload]").change(function(){
    			//验证文本框的内容是否有效
    			$(this).validatebox("validate");
    		});
    		
    		$("textarea[name=remark]").validatebox({
    			required:true,
    			missingMessage:'请输入简单描述'
    		});
    		
    		$("textarea[name=xremark]").validatebox({
    			required:true,
    			missingMessage:'请输入详细描述'
    		});
    		
    		//默认禁止验证功能
    		$("#ff").form("disableValidation");
    		
    		$("#submit").click(function(){
    			//开启验证
    			 $("#ff").form("enableValidation"); 
    			//如果验证成功，则提交数据
    			if($("#ff").form("validate")){
    				//提交数据
    				$('#ff').form('submit',{
    					url:'product_update.action',
    					success:function(){
    						//关闭当前窗体
    						parent.$("#win").window("close");
    						//刷新页面
							var dg = parent.$("iframe[title='商品管理']").get(0).contentWindow.$("#dg");
    						
    						dg.datagrid("reload");
    					}
    				});
    			}
    		}); 
    		
    		$("#reset").click(function(){
    			//充值当前表单数据
    			$("#ff").form("reset");
    		});
    	});
    	
    </script>
  </head>
  
  <body>
	<form id="ff" title="添加商品" method="post" enctype="multipart/form-data"> 
	     <div>   
	        <input class="easyui-validatebox" type="hidden" id="id" name="id" value=""/>   
	    </div>   
	    <div>   
	        <label>商品名称:</label>   
	        <input type="text" name="name"/>   
	    </div><br>
	     <div>   
	        <label>商品价格:</label>   
	        <input type="text" name="price"/>   
	    </div><br> 
	    
	     <div>   
	        <label>图片上传:</label>     	    
	        <input type="text" name="pic" id="pic"/>     	      
	        <input  type="file" name="fileImage.upload" value="12"/>   
	    </div><br> 
	    
	     <div>   
	        <label>所属类别:</label>   
	         <input id="cc" name="category.id"> 
	    </div><br> 
	    <div>
	    	<label>加入推荐：</label>
	    	推荐：<input type="radio" name="commend" checked="checked" value="true">
	    	不推荐：<input type="radio" name="commend" value="false">
	    </div><br>
	    <div>
	    	<label>是否有效：</label>
	    	上架：<input type="radio" name="open" checked="checked" value="true">
	    	下架：<input type="radio" name="open"  value="false">
	    </div><br>
	    <div>   
	        <label>简单描述:</label>   
	        <textarea  name="remark" cols="40" rows="4"></textarea>  
	    </div><br>
	    <div>   
	        <label>详细描述:</label>   
	       <textarea  name="xremark" cols="40" rows="8"></textarea>  
	    </div><br> 
	    <div>
	    	<a id="submit" href="#" class="easyui-linkbutton">添加</a>
	    	<a id="reset" href="#" class="easyui-linkbutton">重置</a>
	    </div> 
	</form>  

  </body>
</html>
