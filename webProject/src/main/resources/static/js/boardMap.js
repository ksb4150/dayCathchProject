var markers = []; // 마커를 담을 배열
var myMarkers = []; // 마커를 담을 배열
var str = '';

var place_address_arr = []; // 클릭한 마커의 좌표? 주소를 담을 배열
var place_name_arr = [];


var coor = []; // 도로명 주소를 좌표로 변환한 값을 담을 배열 
var bounds = new kakao.maps.LatLngBounds(); // 지도를 재설정할 범위정보를 가지고 있을
var seResult = true; //검색 결과를 가지고 있을 변수

var mapContainer = document.getElementById('map'), // 지도를 표시할 div의 주소?
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심 좌표
        level: 3 // 
    };

//지도 생성
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성
var ps = new kakao.maps.services.Places();  

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 주소-좌표 변환 객체를 생성
var geocoder = new kakao.maps.services.Geocoder();

// 키워드로 장소를 검색, default로 할 거 있으면 하기
searchPlaces();

function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청
    ps.keywordSearch( keyword, placesSearchCB);
}

// 장소검색이 완료됐을 때 호출되는 콜백 함수
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        // 정상적으로 검색이 완료되면
        // 검색 목록과 마커를 표출
        displayPlaces(data);
        // 페이지 번호를 표출
        displayPagination(pagination);
		seResult = true;
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        alert('검색 결과가 존재하지 않습니다.');
        seResult = false;
        return;
    } else if (status === kakao.maps.services.Status.ERROR) {
        alert('검색 결과 중 오류가 발생했습니다.');
        seResult = false;
        return;
    }
}

// 검색 결과 목록과 마커를 표출하는 함수
function displayPlaces(places) {
    var listEl = document.getElementById('placesList'),  // 검색 결과가 표시될 ul의 주소
    	menuEl = document.getElementById('menu_wrap'), // 검색하는 곳을 포함한 div
    	fragment = document.createDocumentFragment(), //다른 노드를 담는 임시 컨테이너 역할을 하는 특수 목적 노트 생성?
    	bounds = new kakao.maps.LatLngBounds() // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
    
	    // 검색 결과 목록에 추가된 항목들을 제거
	    removeAllChildNods(listEl);

	    //지도에 표시되고 있는 마커를 제거
	    removeMarker();
    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // 마커를 생성하고 지도에 표시
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성
	        
	        var obj = places[i]; //검색 결과 항목을 obj에 넣음
	        	
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기 위해
		        // LatLngBounds 객체에 자표를 추가
		        bounds.extend(placePosition);
	
	        // 마커와 검색 결과 항목에 mouseover 했을 때
	        // 해당 장소에 인포윈도우에 장소명을 표시
	        // mouseout 했을 때는 인포위도우를 닫음
	        (function(marker, title, obj) { // obj = 검색 결과 항목들
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });
	
	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });
	
	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };
	
	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	            
				kakao.maps.event.addListener(marker, 'click', function() {
					Swal.fire({
			            title: '장소를 추가하시겠습니까?',
			            showCancelButton: true,
			            confirmButtonColor: '#3085d6',
			            cancelButtonColor: '#d33',
			            confirmButtonText: '추가',
			            cancelButtonText: '취소'
			        }).then((result)=> {
			            if(result.isConfirmed) {
			                
							var detail = '';
		                	var placeName = '';
		
					    	if (obj.place_name) {
			        			detail = obj.address_name; // 클릭한 마커의 도로명 주소 들어감
			                    placeName = obj.place_name; // 클릭한 마커의 장소 이름이 들어감
			                    
			                    place_address_arr.push(detail); // 도로명 주소 추가
			      				place_name_arr.push(placeName);
			      				
			      				
			      				var check = "add";
			      				 	exchange(detail, check); // 도로명 주소 변환 함수에 도로명 주소 추가
			                } else {
			        			alert = '실패했습니다.'; 
			        			return false;
			    			}
			                
			                setTimeout(function(){   // 억지로 동기 만들기..ㅎ  
			                	if(seResult === false) {
									Swal.fire(
				                    '추가에 실패했습니다, 관리자에게 문의해주세요.',
				                    'fail'
			                		);
			                		return false;
								}
			                	Swal.fire(
				                    '추가되었습니다.',
				                    'success'
			                	);
			                	addPlaceList(obj); // 오른쪽에 선택한 장소 넣기 함수
			                }, 300);
						}
	        		}); // end then 
				});
	       })(marker, places[i].place_name, obj);
	
	        fragment.appendChild(itemEl);
		
		} // end for문

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정
    map.setBounds(bounds);
}

// 
function exchange(road, check) {
	// 주소-좌표 변환 객체 생성
	var geocoder2 = new kakao.maps.services.Geocoder();
	
		//주소를 변환하기 위해 요청
		geocoder2.addressSearch(road, function(result, status) {
	        // 정상적으로 검색이 완료됐으면
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x); //변환 환료 된 좌표
                if(check === "add") {
					coor.push(coords); // 좌표로 변환해서 coor 저장, 원래는 return 없었음
				} else if(check === "remove") {
					var index3 = coor.indexOf(coords);
						coor.splice(index3, 1);
				}
				seResult = true;
                
	        }  else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		        seResult = false;
		        return;
		
		    } else if (status === kakao.maps.services.Status.ERROR) {
		        seResult = false;
		        return;
		    }
	    });
}

var NUM = 0; //checkbox를 특정하기 위해 주는 전역 변수..ㅠㅠ

function addPlaceList(obj) {
    var selectPlace = document.getElementById('select_place');
    var el = document.createElement('li');

    itemStr = '';
    if(selectPlace.length > 0) { // 지금은 안돌아감
        itemStr += '<div class="triangle"></div>';
    }
    
    itemStr += '<div class="select_item_wrap">' +
            '   <input class="select_checkbox" type="checkbox" id="'+'check'+NUM+'"/>'+
            '   <div class="select_custom_info">' +
            '   <h5 class="select_place_name">' + obj.place_name + '</h5>' +
            '   <input type="number" min="0" max="24" class="times"/> 시간' +
            '   <input type="number" min="0" max="59" class="times"/> 분' +
            '   </div> </div>';
            
    el.innerHTML = itemStr;
	el.className = 'select_item';

	selectPlace.appendChild(el);

    var check = document.getElementById('check'+NUM);

	    check.addEventListener("change", function() {
			if($(this).prop("checked")) {
				Swal.fire({
		            title: '정말 삭제하시겠습니까?',
		            showCancelButton: true,
		            confirmButtonColor: '#3085d6',
		            cancelButtonColor: '#d33',
		            confirmButtonText: '삭제',
		            cancelButtonText: '취소'
		        }).then((result)=> {
		            if(result.isConfirmed) {
	
		                var index1 = place_address_arr.indexOf(obj.address_name);
		                var index2 = place_name_arr.indexOf(obj.place_name);
		             	var check = "remove";
		             	
							place_address_arr.splice(index1, 1);
			                place_name_arr.splice(index2, 1); 
			            	exchange(obj.address_name, check);    
			                
			                setTimeout(function(){   // 억지로 동기 만들기..ㅎ  
				                	Swal.fire(
					                    '삭제되었습니다.',
					                    'success'
				                	);
				                	el.remove();
				                }, 300);
		            }
		        });   	
			}
	    }); // change eventlistener end
    
    NUM++;
}

// 검색결과 항목을 Elemnet로 반환
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', //
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출
    markers.push(marker);  // 베얄에 생성된 마커를 추카

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지 번호를 표시
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수
// 인포윈도우에 장소명을 표시
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색 결과 목록의 자식 Element를 제거하는 함수
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 상세 주소 정보를 요청
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

function addMyMarker(position) { //position : coor[i]
    var myMarker = new kakao.maps.Marker({
        position: position
    });
    
    // 마커가 지도 위에 표시되도록 설정합니다
    myMarker.setMap(map);
    
    // 생성된 마커를 배열에 추가합니다
    myMarkers.push(myMarker);
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

function myMapResult() {
    removeMarker(); // 기존 마커 지우기
	
	for(var i=0; i<coor.length; i++) {
		addMyMarker(coor[i]);	
		bounds.extend(coor[i]); //마커 좌표 bounds에 추가	
		setBounds();
		line();
	}

}

function addToString() {
	var len = place_address_arr.length
	for(var i=0; i<len; i++) {
		str +=  place_address_arr[i]; 
		if(i < len-1) {
			str += ','
		}
	}
	
	$('#address_list').val(str);
}