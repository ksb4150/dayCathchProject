
$(document).ready(function(){

/* 숫자만 입력 받는 이벤트 */
    $('#userBirth').off('keyup').on('keyup', function(e){
        var birth = $(this).val();
        if (!(e.keyCode >= 48 && e.keyCode <= 57)) {
            $(this).val($(this).val().replace(/[^(0-9)]/gi, ''));
        }

        if(birth.length > 0 && birth !== '') {
            document.getElementById("birthChk1").style.display="none";
        } else {
            document.getElementById("birthChk1").style.display="block";
        }

        if(birth.length !== 8 || birth.substr(0,4) > (new Date()).getFullYear() || birth.substr(4,2) > 12 || birth.substr(6,2) > 31 ){
            document.getElementById("birthChk2").style.display="block";

         	return;
        } else {
            document.getElementById("birthChk2").style.display="none";
        }
    });
    
    /* 최대 입력 글자 수 제한 이벤트 */
    $('#userPhoneNumber, #userBirth').off('input').on('input', function(e){
        var maxLength = $(this).attr('maxLength');
        if ($(this).val().length > maxLength){
            $(this).val($(this).val().slice(0, maxLength));
        }
    });

    $('#userPwd1').off('keyup').on('keyup', function(e){
        var pwd1 = $("#userPwd1").val();

        if($("#custPassChk").val() === "Y"){ 
            document.getElementById("pwdChk1").style.display="none";
        }

        if (pwd1.length > 0){
            document.getElementById("pwdChk3").style.display="none"; //비밀번호를 입력해주세요 none
            var cnt = 0;
            var format1 = /[0-9]/;
            if(format1.test(pwd1)){ // 아니면 cnt 증가
                cnt ++ ;
            }

            var format2 = /[a-zA-Z]/;
            if(format2.test(pwd1)){
                cnt ++ ;
            }

            var format3 = /[~?!@#$%<>^&*\()\-=+_\’\:\;\.\,\"\'\[\]\{\}\/\|\`]/gi;
            if(format3.test(pwd1)){
                cnt ++ ;
            }

            if((cnt >= 2 && pwd1.length >= 10) || (cnt >= 3 && pwd1.length >= 8)){
                $("#custPassChk").val("Y"); //비밀번호 유효성 검사 통과
                document.getElementById("pwdChk1").style.display="none";
            } else {
                document.getElementById("pwdChk1").style.display="block";
                $("#custPassChk").val("N");
            }
        } else {
            $("#custPassChk").val("N");
            document.getElementById("pwdChk3").style.display="block"; //비밀번호를 입력해주세요
        }
            
    });


    $('#userPwd2').off('keyup').on('keyup', function(){
        var pwd1 = $("#userPwd1").val();
        var pwd2 = $("#userPwd2").val();
        
        if (pwd2.length > 0){
            document.getElementById("pwdChk4").style.display="none"; //비밀번호 확인 입력 none 
            if (pwd1 === pwd2){
                document.getElementById("pwdChk2").style.display="none";
            } else {
                document.getElementById("pwdChk2").style.display="block";
            }
        } else {
            document.getElementById("pwdChk4").style.display="block"; //비밀번호 확인 입력해주세요
        }
    });

	$('#userPhoneNumber').off('keyup').on('keyup', function(e){    
	    if (!(e.keyCode >= 48 && e.keyCode <= 57)) {
	        var inputVal = $(this).val();
	        $(this).val(inputVal.replace(/[^(0-9)]/gi, ''));
	    }
	    
	    if(!$("#userPhoneNumber").val().match(/^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/)) {
			document.getElementById("phoneChk1").style.display="block";
		} else {
			document.getElementById("phoneChk1").style.display="none";
		}
	});
});