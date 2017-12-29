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
	  $(".jqzoom").css("z-index","-1");
    }  
    function mOut(){  
     $(".testbox").css("display","none");
	  $(".jqzoom").css("z-index","0");
    }  
	function addShipAddress() {
    $(".modal,.modal-shadow").show();

    var shipAddressForm = document.forms["shipAddressForm"];

    shipAddressForm.elements["saId"].value = 0;
    shipAddressForm.elements["consignee"].value = "";
    shipAddressForm.elements["mobile"].value = "";
    shipAddressForm.elements["email"].value = "";
    shipAddressForm.elements["address"].value = "";

    $("#cityId").html("<option selected='selected' value='-1'>请选择</option>");
    $("#regionId").html("<option selected='selected' value='-1'>请选择</option>");
    bindProvinceList(document.getElementById("provinceId"), 0);

    $(shipAddressForm.elements["isDefault"]).prop("checked", false);
}
 function showPreferential() {
                    $(".checkout-preferential").show();
                    getValidCouponList();
                }
                function changeTag(index) {
                    $(".checkout-preferential .tag").toggleClass("active")
                    $(".checkout-preferential .tag-body").each(function (i, e) {
                        if (i == index) {
                            $(e).show();
                        }
                        else {
                            $(e).hide();
                        }
                    })
                }
				   $("#provinceId").change(function () {
            var selectedProvinceId = $(this).find("option:selected").val();
            if (selectedProvinceId > 0) {
                $("#regionId").html("<option value='-1'>请选择</option>");
                bindCityList(selectedProvinceId, document.getElementById("cityId"));
            }
        })

        //绑定市列表的改变事件
        $("#cityId").change(function () {
            var selectedCityId = $(this).find("option:selected").val();
            if (selectedCityId > 0) {
                bindCityList(selectedCityId, document.getElementById("regionId"));
            }
        })
		function showPic(whichpic) {
  if (!document.getElementById("placeholder")) return true;
  var source = whichpic.getAttribute("href");
  var placeholder = document.getElementById("placeholder");
  placeholder.setAttribute("src",source);
   placeholder.setAttribute("jqimg",source);
}

function prepareGallery() {
  if (!document.getElementsByTagName) return false;
  if (!document.getElementById) return false;
  if (!document.getElementById("imagegallery")) return false;
  var gallery = document.getElementById("imagegallery");
  var links = gallery.getElementsByTagName("a");
  for ( var i=0; i < links.length; i++) {
    links[i].onclick = function() {
      return showPic(this);
	}
    links[i].onkeypress = links[i].onclick;
  }
}

function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      oldonload();
      func();
    }
  }
}

addLoadEvent(prepareGallery);

 $(function(){
                $(".jqzoom").jqueryzoom({
             
                    xzoom: 400, //放大图的宽度(默认是 200)
                    yzoom: 300, //放大图的高度(默认是 200)
                    offset: 60, //离原图的距离(默认是 10)
                    position: "right", //放大图的定位(默认是 "right")
                    preload: 1
                });

             
 })
 $(function(){
 $("#send").click(function(){
	 $("#dhtp").load("index3.html")
 });
});
  //绑定省列表的改变事件
        $("#provinceId").change(function(){
            var selectedProvinceId = $(this).find("option:selected").val();
            if (selectedProvinceId > 0) {
                $("#regionId").html("<option value='-1'>请选择</option>");
                bindCityList(selectedProvinceId, document.getElementById("cityId"));
            }
        })

        //绑定市列表的改变事件
        $("#cityId").change(function(){
            var selectedCityId = $(this).find("option:selected").val();
            if (selectedCityId > 0) {
                bindCityList(selectedCityId, document.getElementById("regionId"));
            }
        })

        provinceId = -1; //省id
        cityId = -1; //市id
        countyId = -1; //县或区id

        //绑定省列表
        bindProvinceList(document.getElementById("provinceId"), provinceId);

        if (cityId > 0) {
            bindCityList(provinceId, document.getElementById("cityId"), cityId);
            bindCountyList(cityId, document.getElementById("regionId"), countyId);
        }