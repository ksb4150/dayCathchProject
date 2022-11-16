<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="userInfo" value="${user}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

	<script src="/js/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/css/communityBoard.css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

	<title>글쓰기</title>
	
	<script>
		$(document).ready(function() {
			rFlag = false;
			articleNO = 0;
			
			$('#articleNO').val(makeRandomNumber());
			
			function makeRandomNumber() {
				if(!rFlag) {
					articleNO = Math.floor(Math.random()*1000000);
					rFlag = true;
				}
				
				return articleNO;
			}
			
			$('#articleCategory').change(function() {
				var cat = $('#articleCategory option:selected').val();
				
				if(cat === '자유') {
					$('#place_wrap').css('display', 'none');
				} else {
					$('#place_wrap').css('display','block');
				}
				
				
			});
			
			$('#summernote').summernote({
		 	    placeholder: 'content',
			    minHeight: 370,
			    maxHeight: null,
			    focus: true, 
		        lang : 'ko-KR',
		        callbacks: {
	 	    		onImageUpload : function(files, editor, welEditable){
	 	                 // 파일 업로드(다중업로드를 위해 반복문 사용)
	 	        	   for (var i = files.length - 1; i >= 0; i--) {
	 	        		   sendImg(files[i], this);
	 	               }
	 	    		},
	 	    		onMediaDelete : function(target) {
 	        		   deleteFile(target[0].src);
	 	    		}
		 	    } 
			  });
			  
			  function sendImg(file, el) {
					var data = new FormData();
					var Num = articleNO;
						data.append("file", file);
						data.append("articleNO", Num);
						
					$.ajax({
						data : data,
						type : "POST",
						enctype : 'multipart/form-data',
						url : "${contextPath}/board/summernoteImage.do",
						cache: false,
						contentType : false,
						processData : false,
						success: function(data) {
							var json = JSON.parse(data);
							var url = json.url;
							$(el).summernote('editor.insertImage', url, '');
						},
						error: function(request, status, error) {
		                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		                }
					});
				}
			  
			  function deleteFile(file) {
				  var data = new FormData();
				  var Num = articleNO;
				  var splitSrc = file.split("=");
				  var fileName = splitSrc[splitSrc.length-1];
				  
				  	data.append("articleNO", Num);
					data.append("fileName", fileName);
					
					$.ajax({
						data : data,
						type : "POST",
						url : "${contextPath}/board/summernoteDeleteImage.do",
						cache: false,
						contentType : false,
						processData : false,
						success: function(data) {
							var json = JSON.parse(data);
							var result = json.responseCode;
							alert(result);
						},
						error: function(request, status, error) {
		                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		                }
					});
			  }
			  
	
				goWrite = function(frm) {
					var title = frm.title.value;
					var content = frm.content.value;
					
					if (title.trim() == ''){
						alert("제목을 입력해주세요");
						return false;
					}
					
					if (content.trim() == ''){
						alert("내용을 입력해주세요");
						return false;
					}
					
					addToString();
					frm.submit();
				}
				
				readURL = function(input) {
					if(input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							$('#preview').attr('src', e.target.result);
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
		});
	</script>	
	</head>
<body>
	<div class="contents_area">
	<br>
		<h2 style="text-align: center;">커뮤니티 글쓰기</h2><br>
		<div class="board_content">
			<div class="content_wrap">
				<form method="post" id="frm" name="boardFrm" action="${contextPath}/board/write.do" enctype="multipart/form-data">
				<input type="hidden" id="uid" name="uid" value="${userInfo.uid}"/>
				<input type="hidden" id="userName" name="userName" value="${userInfo.userName}"/>
				<input type="hidden" id="articleNO" name="articleNO"/>
				<input type="hidden" id="address_list" name="addressList" />
				<div class="tit_wrap">
					<select name="articleCategory" class="articleCategory" id="articleCategory">
						<option value="계획">계획</option>
						<option value="후기">후기</option>
						<option value="자유">자유</option>
					</select>
					<input type="text" id="title" name="title" placeholder="제목"/>
					<div class="pic_wrap">
						<h5>게시글 대표 이미지</h5>
						<input type="file" name="file" onchange="readURL(this);" /> 
						<img id="preview" style="width:100px; height:100px;"/>
					</div>
				</div>
				<textarea id="summernote" name="content">
				
				</textarea>
					<input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>
				</form>
			</div>
			
		<div id="place_wrap">
			<div class="map_wrap">
				<div id="map" style="width:960px; height:100%;position:relative;overflow:hidden; margin: 0px;"></div>
		
			    <div id="menu_wrap" class="bg_white">
			        <div class="option">
			            <div>
			                <form onsubmit="searchPlaces(); return false;">
			                    키워드 : <input type="text" value="부산" id="keyword" size="15"> 
			                    <button type="submit">검색하기</button> 
			                </form>
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
			    <div id="select_places_wrap">
			    	<ul id="select_place">
	    			</ul>
	    		</div>
			</div>
			<input id="my_map_btn" type="button" value="내 지도 보기" onclick="myMapResult();"/>
	    </div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9fdcadf32f7a781b43f14d2f91977aea&libraries=services"></script>
		<script type="text/javascript" src="/js/boardMap.js" charset="UTF-8"></script>
		
		</div>
	</div>
</body>
</html>