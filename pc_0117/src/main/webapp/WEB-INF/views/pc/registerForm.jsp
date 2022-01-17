<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/bootstrap/css/registerForm.css">
<script type="text/javascript" src="resources/bootstrap/js/jquery.js"></script>
<script type="text/javascript">
function upload() { // 업로드 안했을경우
	if (!frm.pcimage.value) {
		alert("사진을 넣어주세요.");
		frm.pcimage.focus();
		return false;
	}
	else if(!frm.pcinfo.value) {
		alert("정보 입력!")
		frm.pcimage.focus();
		return false;
	}
}
$(document).ready(function() {
	$("input[name='info']").on("click", function(e) {
		e.preventDefault();
		fn_chkInfo($(this));
		
	});
});

function fn_chkInfo(obj) {
	if(obj.attr("class") == "_checked") {
		obj.removeClass("_checked");
	} else {
		obj.addClass("_checked");
	}
}

function fn_selectInfo() {
	var str = "";
	var strId = "";
	
	$("input[name='info']").each(function(index, element) {
		if($(this).attr("class") == "_checked") {
			str += ((str.length>0) ? "," : "") + $(this).val().trim();
			strId +=((strId.length>0) ? "," : "") + $(this).attr("id");
		}
	});
	var selectContent = str;
	if(selectContent.length > 30) {
		selectContent = str.substring(0,30) + "...";
	}
	$("#selectInfoList").text(selectContent);
	document.getElementById("pcinfo").value = selectContent;
	/* $("#divInfoLayer").hide();  */
}

</script>
</head>
<body>
<div class="total_content" align="center">
		<form action="register.do" name="frm" method="post" onsubmit="return upload()" enctype="multipart/form-data">
			<div class="join_total">
			<div class="title_size">가맹점 등록</div>
				<div class="join_content">
					<input placeholder="사업자등록번호" type="text" name="pcbusinessnum" required="required" class="form-control" style="width:335px;">
				</div>
				<p>
				<div class="join_content">
					<input placeholder="pc방 이름" type="text" name="pcname" required="required" class="form-control" style="width:335px;">
				</div>
				<p>
				<div class="join_content">
					<input placeholder="pc방 내부사진" type="file" name="pcimage" required="required" multiple="multiple" readonly="readonly" class="form-control">
				</div>
				<p>
				<div class="join_content">
					<input type="text" name="pcpno" required="required" title="전화형식 3-3,4-4" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="010-1111-1111" class="form-control" style="width:335px;">
				</div>
				<p>
				<div>
				<div class="join_content content_id">
					<input type="text" name="pcaddr" id="pcaddr" required="required" placeholder="주소" style="width:300px" readonly="readonly" class="form-control">
					<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" class="btn btn-primary btn_size"><br>
				</div>
					<div id="map" style="width:300px;height:300px;margin-top:10px;display:block;"></div>
				</div>
				<p>
				<div class="join_content">
					정보
					<div class="service-cont">
						<a href="#" class="service-tit">
							<strong id="selectInfoList"></strong>
						</a>
						<div id="divInfoLayer" class="layer-service">
							<p>정보 선택</p>
							<input type="button" value="프린트" name="info">
							<input type="button" value="듀얼모니터" name="info">
							<input type="button" value="커브모니터" name="info">
							<div>
								<span>
									
								</span>
								<button type="button" onclick="fn_selectInfo()" class="btn btn-primary btn_size">확인</button>
							</div>
						</div>
					</div>
				</div>	
				<div>
					<input type="hidden" name="pclati" id="pclati">
					<input type="hidden" name="pclongi" id="pclongi">
					<input type="hidden" name="pcinfo" id="pcinfo">
				</div>
			</div>
			<div align="center">
			<button id="submit" type="submit" class="btn btn-primary btn_size">확인</button>
			</div>
		</form>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f32d148d5a0f1b0127e3645366eccc05&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("pcaddr").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        
                        var lati = result.y;
                        var longi = result.x;
                        document.getElementById("pclati").value = lati;
                        document.getElementById("pclongi").value = longi;
                        
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
</body>
</html>