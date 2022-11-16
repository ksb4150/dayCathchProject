<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="board"  value="${resultMap.board}"  />
<c:set var="boardComments"  value="${resultMap.comment}"  />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

	<script src="/js/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/css/communityBoard.css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    <script type="text/javascript">
	    $(document).ready(function(){
			var articleNO = $("#articleNO").val();
				getCate();
				
			function getCate() {
				const cat =$("#articleCategory").val();
					
				if(cat === '자유') {
					$('#place_wrap').css('display', 'none');
				} else {
					$('#place_wrap').css('display','block');
				}
			}
			  
			  sendImg = function(file, el) {
					var data = new FormData();
					var Num = $('#articleNO').val();
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
			  
			  deleteFile = function(file) {
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
	    
	    function removeBoard(articleNO) {
	    	console.log(articleNO)
			var form = document.createElement("form");
				form.setAttribute("method", "post");
				form.setAttribute("action", "${contextPath}/board/removeArticle.do");
			var articleNOInput = document.createElement("input");
			    articleNOInput.setAttribute("type","hidden");
			    articleNOInput.setAttribute("name","articleNO");
			    articleNOInput.setAttribute("value", articleNO);
			    
			    form.appendChild(articleNOInput);
			    document.body.appendChild(form);
			    form.submit();
		}
	    
	    function modifyBoard() {
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
	    	
	    	$('#view_board').css("display", "none");
	    }
	    
	    function fn_modify_article(frm) {
	    	frm.action = "${contextPath}/board/modArticle.do";
	    	frm.submit();
	    }
	</script>
</head>
<body>
<div class="contents_area">
	<input id="addressList" type="hidden" value="${board.addressList}"/>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9fdcadf32f7a781b43f14d2f91977aea&libraries=services"></script>
    <script type="text/javascript" src="/js/viewBoard.js"></script>
    
    <div id="main_image" >
    	<img style="width:100%; height:100%;" src="${contextPath}/bThumbDownload.do?articleNO=${board.articleNO}&mainImageFileName=${board.mainImageFileName}"/>
    </div>
    
    <div class="board_content">
    	<form name="modArticleForm" method="post" enctype="multipart/form-data">
    		<input id="articleNO" name="articleNO" type="hidden" value="${board.articleNO}"/>
		    <div class="view_title_wrap">
		    	<input class="pointer_event view_category " id="articleCategory" name="articleCategory" value="${board.articleCategory}"/>
			    <input id="view_title" class="pointer_event" name="title" value="${board.title}" readOnly/> 
			    <div class="user_info_wrap">
				    <div id="view_userName" class="pointer_event" name="userName"> ${board.userName}</div>
				    <div id="view_date" name="writeDate"> ${board.writeDate} / 조회수 ${board.viewCnt} </div>
			    </div>
			    <div class="pic_wrap" style="display:none">
					<h5>게시글 대표 이미지</h5>
					<input type="file" name="file" onchange="readURL(this);"/> 
					<input type="hidden" name="mainImageFileName" value="${board.mainImageFileName}"/>
					<img id="preview" style="width:100px; height:100px;" src="${contextPath}/bThumbDownload.do?articleNO=${board.articleNO}&mainImageFileName=${board.mainImageFileName}"/>
				</div>
			</div>
			<div id="view_board">
				${board.content}
			</div>
			<textarea id="summernote" name="content" style="display:none">
				${board.content}
			</textarea>
		    <c:if test="${member.uid == board.uid}">
			    <div class="buttons">
			    	<input type="button" value="수정" onclick="modifyBoard()"/>
			    	<input type="button" value="삭제" onclick="removeBoard(${board.articleNO})"/>
			    </div>
			    <div class="buttons_mod">
			    	<input type="button" value="수정 반영 하기" onclick="fn_modify_article(this.form)">
			    </div>
			</c:if>
			
			<div id="place_wrap">
				<div class="map_wrap">
					<div id="map" style="width:100%; height:350px;"></div>
				</div>
			</div>
			<input id="addressList" type="hidden" value="${board.addressList}"/>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9fdcadf32f7a781b43f14d2f91977aea&libraries=services"></script>
		    <script type="text/javascript" src="/js/viewBoard.js"></script>
		</form>
		<!-- 찜 -->
		<div class="heart">
			<input type="hidden" value="${board.articleNO}"/>
			<input type="hidden" value="${member.uid}"/>
			<a class="text-dark heart" style="text-decoration-line: none;"> 
			<img src="/img/heart.svg" id="heart"> 좋아요(${board.likecount}) </a>
		</div>

		</div>
	<div class="comments_area">
		<c:choose>
			<c:when test="${isLogOn == true && member != null }">
				<form id="comment_form" name="commentForm" action="${contextPath}/board/addBoardComment.do" method="post">
					<input type="hidden" name="articleNO" value="${board.articleNO}"/>
					<div class="comment_form_wrap">
						<div class="comment_user_info">
							<div class="user_info">
								${member.userName}
							</div>
						</div>
						<div id="review_input_wrap">
							<input type="text" id="comment_content" name="commentContent" />
						</div>
						<div class="form_button_wrap">
							<input type="submit" class="commentBtn" value="작성"/>
						</div>
					</div>
				</form>
			</c:when>
			<c:otherwise>
				<div class="nonuserInfo"> 댓글은 로그인 후 이용가능합니다. </div>
			</c:otherwise>
		</c:choose>
	
		<div class="comments">
			<ul>
				<c:if test="${not empty boardComments && boardComments != 'null'}">
					<c:forEach var="comment" items="${boardComments}" varStatus="status">
						<li>
							<div class="comment_wrap">
								<div class="comment_info">
									<div class="comment_user">
										${comment.userName}
									</div>
									<div class="comment_write_day">
										${comment.regDate}
									</div>
								</div>
								<div class="comment_content">
									${comment.commentContent}
								</div>
							</div>
						</li>
					</c:forEach>
				</c:if>
			</ul>
		</div>
	</div>
</div>
<script>
$(document).ready(function () {

    var heartval = ${heart};

    if(heartval>0) {
        console.log(heartval);
        $("#heart").prop("src", "/img/heart-fill.svg");
        $(".heart").prop('name',heartval)
    }
    else {
        console.log(heartval);
        $("#heart").prop("src", "/img/heart.svg");
        $(".heart").prop('name',heartval)
    }

    $(".heart").on("click", function () {

        var that = $(".heart");
        console.log(that.prop('name'));

        var sendData = {'articleNO' : '${board.articleNO}','heart' : that.prop('name')};
        $.ajax({
            url :'/board/heart',
            type :'POST',
            data : sendData,
            success : function(data){
                that.prop('name',data);
                if(data==1) {
                    $('#heart').prop("src","/img/heart-fill.svg");
                }
                else{
                    $('#heart').prop("src","/img/heart.svg");
                }


            }
        });
    });
});
</script>
</body>
</html>