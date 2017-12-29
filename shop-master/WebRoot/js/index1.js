// JavaScript Document
window.onscroll = function(){ 
    var t = document.documentElement.scrollTop || document.body.scrollTop;  
    var top_brand = document.getElementById( "brand" ); 
	var top_navigation = document.getElementById( "navigation" ); 
	var top_input = document.getElementById("input");
    if( t >= 100 ) { 
        top_brand.className="hide"; 
		top_navigation.className="hide";
		top_input.className="show";
    } else { 
        top_brand.className="show"; 
		top_navigation.className="show";
		top_input.className="hide";
    } 
} 
$(function(){
  $('#search').val("请输入关键字").addClass("c1");
  $('#search').focus(function(){//搜索框获得焦点时
   if($('#search').val()=="请输入关键字"){
    $('#search').val("").addClass("c2").removeClass("c1");
   }
  });
  $('#search').blur(function(){//搜索框失去焦点时
   if($('#search').val()==""){
    $('#search').val("请输入关键字").addClass("c1").removeClass("c2");
   }
  });
 });
 $().ready(function(){$(".testbox ul li").hover(function(){$(this).find(".boxshow").show();},function(){$(this).find(".boxshow").hide();});});


  function mOver(){  
       $(".testbox").css("display","block");
     $("._img").css("z-index","-1");
    }  
    function mOut(){  
     $(".testbox").css("display","none");
    }  
 
