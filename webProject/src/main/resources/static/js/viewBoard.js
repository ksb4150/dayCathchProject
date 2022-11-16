str = $('#addressList').val();


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
		
// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 


var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성
var bounds = new kakao.maps.LatLngBounds(); // 지도를 재설정할 범위정보를 가지고 있을 객체

var addr = str.split(','); // 도로명 주소 배열
var coor = []; // 도로명 주소를 좌표로 변환한 값을 담을 배열
var markers = [];

exchange();
function exchange() {
	var geocoder = new kakao.maps.services.Geocoder();
	var flag = 0
		for(var i=0; i<addr.length; i++) {
			// 
			geocoder.addressSearch(addr[i], function(result, status) { //도로명 주소를 가지고 가서 callback 함수 실행 
		
				if (status === kakao.maps.services.Status.OK) {
					flag++;
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						addMarker(coords);
						coor.push(coords);
					
						bounds.extend(coords); //마커 좌표 bounds에 추가
						setBounds(); // 마커를 즁삼으로 위치 재설정
						
					if(flag == addr.length) {
						line();
					}	
						
				} else {
					 setTimeout(function(){  
						
					}, 300);
				}
			}); 	
		}
}

function addMarker(position) { //position : coords
	var marker = new kakao.maps.Marker({
		position: position
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 생성된 마커를 배열에 추가합니다
	markers.push(marker);
}

function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
        
     // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(points[i]);
    }            
}

function setBounds() {
    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    map.setBounds(bounds);
}	

function line() {
	var linePath = [];
	// 선을 구성하는 좌표 배열
	for(var i=0; i<coor.length; i++) {
		var c = coor[i];
			linePath[i] = new kakao.maps.LatLng(c.getLat(), c.getLng());
	}
	
	// 지도에 표시할 선을 생성
	var polyline = new kakao.maps.Polyline({
	    path: linePath, // 선을 구성하는 좌표배열
	    strokeWeight: 10, // 선의 두께
	    strokeColor: '#FFAE00', // 선의 색깔
	    strokeOpacity: 0.7, // 선의 불투명도
	    strokeStyle: 'solid' // 선의 스타일
	});
    
	// 지도에 선을 표시
	polyline.setMap(map); 
}