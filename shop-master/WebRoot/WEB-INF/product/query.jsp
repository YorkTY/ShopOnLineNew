<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
  <head>
    <%@ include file="/public/head.jspf" %>
    <style type="text/css">
    	body{
    		margin:1px;
    	}
    	.searchbox{
    		margin:-3;
    	}
    </style>
    <script type="text/javascript">
    $(function(){
    	 $('#dg').datagrid({    
    	        url:'product_queryJoinCategory.action',
    	        loadMsg:'请等待…………',
    	        queryParams:{name:''},
    	        //确定id字段为标识字段，在删除，更新的时候有用，如果配置此字段，在翻页的时候被选中的记录不会丢失
    	        idField:'id',
    	       //显示斑马线
    	       striped:true,
    	       //自动适应列
    	       fitColumns:true,
    	       //数据显示在同一行
    	       nowrap:true,
    	       //是否分页
    	       pagination:true,
    	       singleSelect:false,
    	       toolbar: [{
    	   			iconCls: 'icon-add',
    	   			text:'添加商品',
    	   			handler: function(){
    	   				parent.$("#win").window({
    	   					title:'添加商品',
    	   					width:500,
    	   					height:600,
    	   					content:'<iframe src="send_product_save.action" frameborder="0" width="100%" height="100%"/>'
    	   				});
    	   			}
    	  	 	},'-',{
    	   			iconCls: 'icon-edit',
    	   			text:'更新商品',
    	   			handler: function(){
    	   				parent.$("#win").window({
    	   					title:'更新商品',
    	   					width:500,
    	   					height:600,
    	   					content:'<iframe src="send_product_update.action" frameborder="0" width="100%" height="100%"/>'
    	   				});
    	   			}
    	  	 	},'-',{
    	   			iconCls: 'icon-remove',
    	   			text:'删除商品',
    	   			handler: function(){
    	   			//判断是否有选中行记录
    	   				var rows = $("#dg").datagrid("getSelections");
    	   				//rows 返回被选中的行，没有任何行被选中，则返回空数组
    	   				if(rows.length==0){
    	   					$.messager.show({
    	   						title:'错误提示',
    	   						msg:'至少选中一条记录',
    	   						timeout:2000,
    	   						showType:'slide'
    	   					});
    	   				}else{
    	   					$.messager.confirm('删除确认对话框','是否要删除选中的记录',function(r){
    	   						if(r){
    	   							//获取被选中的记录，然后从记录中获取相应的id
    	   							var ids="";
    	   							for(var i=0;i<rows.length;i++){
    	   								ids+= rows[i].id+",";
    	   							}
    	   							//拼接id的值，然后发送后台1,2,3,4
    	   							ids=ids.substring(0, ids.lastIndexOf(","));
    	   							//发送ajax请求
    	   							$.post("product_deleteByIds.action",{ids:ids},function(result){
    	   								
    	   								if(result=="true"){
    	   									//取消选中所有行
    	    	   							$("#dg").datagrid("uncheckAll");
    	   									$("#dg").datagrid("reload");
    	   								}else{
    	   									$.messager.show({
    	   		    	   						title:'删除异常',
    	   		    	   						msg:'删除失败，请检查操作',
    	   		    	   						timeout:2000,
    	   		    	   						showType:'slide'
    	   		    	   					});
    	   								}
    	   							},"text");
    	   						}
    	   					});
    	   				}
    	   			}
    	  	 	},'-',{
    	   			text:"<input id='ss' name='search'>"
    	  	 	}],
  
    	        // 同列属性，但是这些列将会被冻结在左侧
    	        frozenColumns:[[
    	             {field:'xyz',checkbox:true},
    	        	 {field:'id',title:'商品编号',width:100}
    	        ]],
    	        columns:[[    
    	            {field:'name',title:'商品名称',width:200},
    	            {field:'remark',title:'简单介绍',width:300},
    	            {field:'category.type',title:'商品类别',width:100,align:'right',
    	            	formatter: function(value,row,index){
    	    				if(row.category!=null && row.category.type!=null){
    	    					return row.category.type;
    	    				}
    	    			}	
    	            }
    	        ]]    
    	    });
    	 //把普通的文本框转化为搜索文本框
    	 $('#ss').searchbox({ 
    		 //触发查询事件
    		 searcher:function(value,name){ 
    			 //获取当前查询的关键字，通过dg加载相应的信息
    		 	//alert(value + "," + name);
    			 $('#dg').datagrid('load',{name:value});
    		 }, 
    		 prompt:'类别' 
    		 });
    });
   
    </script>
  </head>
  
  <body>
  	<table id="dg"></table>
  </body>
</html>
