<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.ch.pc.model.*"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.mapCenter {
		display: flex;
		justify-content: center;
		position: relative;
	}
	#map {
		width: 80%; 
		height: 550px;
	}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
<script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>

<script type="text/javascript">
	$(function() {
		$('#disp').load('search.do');
	})
</script>
<!-- 시/도 ,읍면동 select box -->
<script type="text/javascript">
jQuery(document).ready(function(){
	  //sido option 추가
	  jQuery.each(hangjungdong.sido, function(idx, code){
	    //append를 이용하여 option 하위에 붙여넣음
	    jQuery('#sido').append(fn_option(code.sido, code.codeNm));
	  });
	 
	  //sido 변경시 시군구 option 추가
	  jQuery('#sido').change(function(){
	    jQuery('#sigugun').show();
	    jQuery('#sigugun').empty();
	    jQuery('#sigugun').append(fn_option('','선택')); //
	    jQuery.each(hangjungdong.sigugun, function(idx, code){
	      if(jQuery('#sido > option:selected').val() == code.sido)
	        jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm));
	    });
	 
	    //세종특별자치시 예외처리
	    //옵션값을 읽어 비교
	    if(jQuery('#sido option:selected').val() == '36'){
	      jQuery('#sigugun').hide();
	      //index를 이용해서 selected 속성(attr)추가
	      //기본 선택 옵션이 최상위로 index 0을 가짐
	      jQuery('#sigugun option:eq(1)').attr('selected', 'selected');
	      //trigger를 이용해 change 실행
	      jQuery('#sigugun').trigger('change');
	    }
	  });
	 
	  //시군구 변경시 행정동 옵션추가
	  jQuery('#sigugun').change(function(){
	    //option 제거
	    jQuery('#dong').empty();
	    jQuery.each(hangjungdong.dong, function(idx, code){
	      if(jQuery('#sido > option:selected').val() == code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
	        jQuery('#dong').append(fn_option(code.dong, code.codeNm));
	    });
	    //option의 맨앞에 추가
	    jQuery('#dong').prepend(fn_option('','선택'));
	    //option중 선택을 기본으로 선택
	    jQuery('#dong option:eq("")').attr('selected', 'selected'); 
	 
	  });
	 
	  jQuery('#dong').change(function(){
		  var sido = jQuery('#sido option:selected').val();
		  var sigugun = jQuery('#sigugun option:selected').val();
		  var dong = jQuery('#dong option:selected').val();
	  });

	 
	});
	 
function fn_option(code, name){
	return '<option value="' + code +'">' + name +'</option>';
}
	
function juso() {
	var sidoIdx=hangjungdong.sido.findIndex(i=>i.sido==$("#sido").val());
	var sigugunIdx=hangjungdong.sigugun.findIndex(i=>i.sigugun==$("#sigugun").val()&&i.sido==$("#sido").val());
	
	if($("#dong").val() != ''){
	var dongIdx=hangjungdong.dong.findIndex(i=>i.dong==$("#dong").val()&&i.sigugun==$("#sigugun").val()&&i.sido==$("#sido").val()); 
	var dong = hangjungdong.dong[dongIdx].codeNm;//동 
	jQuery('#dong > option:selected').val(dong)
	}
	var sido = hangjungdong.sido[sidoIdx].codeNm;//시
	var sigungu = hangjungdong.sigugun[sigugunIdx].codeNm;//시군구
	
	jQuery('#sido > option:selected').val(sido)
	jQuery('#sigugun > option:selected').val(sigungu)
}
<!-- 시/도 ,읍면동 select box 끝--> 


</script>
</head>
<body>

	<!-- search -->
	<form action="main.do" name="frm" onsubmit="return juso()">
		<select id="sido" name="sido">
			<option value="">특별시/도</option>
		</select> 
		<select id="sigugun" name="sigugun">
			<option value="">시/군/구</option>
		</select> 
		<select id="dong" name="dong">
			<option value="">동/읍/면</option>
		</select>
		<input type="submit">
	</form>
	<button onclick="location.href='pcMainForm.do?pcno=1'">pcmain</button>
	<!-- search 끝-->
	<!-- map -->
	<div class="mapCenter">
		<div id="map"></div>
		<div id="disp"></div>
	</div>
	

	<!-- map 끝 -->

	<!-- map script -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f32d148d5a0f1b0127e3645366eccc05&libraries=services"></script>
	<script>
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		}; 

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 키워드로 장소를 검색합니다
		ps.keywordSearch('${location.sido} ${location.sigugun} ${location.dong} pc방', placesSearchCB);

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new kakao.maps.LatLngBounds();

				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
					bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				}

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {

			// 마커를 생성하고 지도에 표시합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(place.y, place.x)
			});
			
			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
			// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			infowindow.setContent('<div style="padding:5px;font-size:12px;">'+ place.place_name + '</div>');
			infowindow.open(map, marker);
			});
		}
		
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		</script>
		<!-- map script 끝 -->
		<!-- 마커생성 -->
		<c:forEach var="pc" items="${list }">
			<script type="text/javascript">	
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
			    markerPosition = new kakao.maps.LatLng('${pc.pclati}', '${pc.pclongi}'); // 마커가 표시될 위치입니다
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition, 
			    image: markerImage // 마커이미지 설정 
			});
		
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map); 
			
			
			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				$.post('pcDetailForm.do?pcno=${pc.pcno}', function(data) {
					$('#disp').html(data);
				});
			alert("${pc.pcname}");
			});
			</script>
		</c:forEach>
		<!-- 마커생성끝 -->
	<form action="search.do">
		<label class="keyword" for="print">프린트</label>
		<input type="checkbox" id="print" class="keywordbox" name="pcinfo" value="프린트">
		<label class="keyword" for="duel">듀얼모니터</label>
		<input type="checkbox" id="duel" class="keywordbox" name="pcinfo" value="듀얼모니터">
		<label class="keyword" for="curve">커브드모니터</label>
		<input type="checkbox" id="curve" class="keywordbox" name="pcinfo" value="커브드모니터">
		<input type="submit" value="찾기">
	</form>
	<div id="disp"></div>
</body>
</html>