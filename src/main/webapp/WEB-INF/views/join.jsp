<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>FAKETUBE</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- Scripts -->
<script src="${cpath}/resources/js/jquery.min.js"></script>
<script src="${cpath}/resources/js/browser.min.js"></script>
<script src="${cpath}/resources/js/breakpoints.min.js"></script>
<script src="${cpath}/resources/js/util.js"></script>
<script src="${cpath}/resources/js/main.js"></script>
<script>
function zzz(){
	 if ($('#user_id').val() !== '') {
        $.ajax({
            type: 'get',
            url: '${cpath}/Idcheck',
            dataType: 'text', // 예상되는 응답 데이터 형식을 텍스트로 지정
            data: { user_id: $('#user_id').val() }, // user_id를 전송
            success: function(result) {
                if (result == '0') {
                    $('#result').text('사용 가능한 아이디입니다.');
                } else {
                    $('#result').text('이미 사용 중인 아이디입니다.');
                }
            },
            error: function() {
                alert('통신 실패ㅠㅠ');
            }
        });
    } else {
        alert('아이디를 입력하세요.');
        $('#user_id').focus();
    }
	 
//	 var form = document.inputForm;
/* 	 var pw = document.getElementById("user_pw");
	var nick = document.getElementById("user_nick");

	 if(pw.value==""){
	 	pw.focus();
	 	alert("비밀번호를 입력해주세요");
	 	return false;
	 }
	 
	 if(nick.value==""){
		 alert("닉넴입력해주세요");
		nick.focus();
	 	return false;		
	 } */
/* 	 if(form.user_pw.value != form.ckuser_pw.value){
	 alert("비밀번호를 확인해주세요.");
	 form.password.focus();
	 return;
	 } */
	/*  if(!form.user_name.value){
	 	alert("이름을 입력해주세요");
	 form.user_name.focus();
	 	return;
	 }
	 if(!form.user_nick.value){
	 	alert("닉네임을 입력해주세요");
	 form.user_nick.focus();
	 	return;
	 }
	 if(!form.user_phone.value){
	 	alert("전화번호를 입력해주세요");
	 form.user_phone.focus();
	 	return;
	 }
	 if(!form.user_email.value){
	 	alert("이메일를 입력해주세요");
	 form.user_email.focus();
	 	return;
	 }
	  if($('#result').text()!='사용가능한 아이디입니다.'){
	  alert("아이디 중복확인해주세요.");
	  form.user_id.focus();
	  return;
	 }
*/
	 form.submit();
}


</script>
<link rel="stylesheet" href="${cpath}/resources/css/main.css">
<style>
	#content {
		padding: 70px;
	}	
		
	.input-group{
		margin: 0 20px;
	}

	.input-group>p{
		margin: 0 0 0 0;
	}

	.input-group>input{
		border-radius: 5px;
		border: solid 1px #d6ddd8;
	}

	.form-control{
		width: 100%;
	}

	#join {
		background: #ffffff;
		padding: 40px 30px 40px 30px;
		border: solid 1px #d6ddd8;
		border-radius: 5px;
	}
	
	#join h2{
		text-align: center;
	}

	#join a{
		color: #373f42;
		font-size: 15px;				
	}

	.checkId {
		border: none;
		background-color: transparent;
		font-size: 14px;
		text-align: right;
		margin-right: 8px;
	}

	.submit-group{
		padding: 10px 0;
		text-align: right;
		margin: 20px;
	}

	.submit-group>input {
		border-radius: 5px;
		border: solid 1px #d6ddd8;
		width: 100%;
	}
		
	.memlogo {
		padding-bottom: 20px;
	}	
		
	.memlogo h1{
		text-align: center;
		font-size: 2.5em;
		font-weight: 600;
	}
	
	.memlogo h1>a{
		text-decoration: none;
		color : #373f42;
	}
	
	.checkId>button:hover{
		cursor: pointer;
	}
	
</style>
<script>
/* 	function checkField(){
		var inputs = document.inputForm;
		
		if(!inputs.user_id.value){
			alert("아이디를 입력해주세요");
			return false;
		}
		if(!inputs.user_pw.value){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		if(!inputs.user_name.value){
			alert("이름을 입력해주세요");
			return false;
		}
		if(!inputs.user_nick.value){
			alert("닉네임을 입력해주세요");
			return false;
		}
		if(!inputs.user_phone.value){
			alert("전화번호를 입력해주세요");
			return false;
		}
		if(!inputs.user_email.value){
			alert("이메일를 입력해주세요");
			return false;
		}
	} */
	
</script>
</head>
<body>

<div id="page-wrapper">

	<!-- Header -->
	
		
	<!-- Content -->
	<section id="content">
		<div class="container">
			<div class="row aln-center">
				<div class="col-12 memlogo">
					<!-- Logo -->
					<h1><a href="${cpath}/Main.do" id="logo"><img class="logoimg" src="${cpath}/resources/css/images/logo.png">MOCA</a></h1>
				</div>
				<div class="col-5 col-12-medium">
					<!-- Box #1 -->
						<section id="join">
							<header>
								<h2>회원가입</h2>
							</header>
							<form action="${cpath}/UserInsert.do" method="post" name="inputForm" onsubmit="return checkField();">
								<div class="input-group">
									<p>아이디</p>
									<input type="text" id="user_id" name="user_id" class="form-control">
								</div>
								<div class="checkId">
									<p id="result"></p>
									<button type="button" id="checkId" class="checkId" onclick="zzz()">중복확인</button>
								</div>
								
								
								<!-- 아이디 중복 -->
	                            <c:if test="${not empty error}">
	                                <p style="color: red">${error}</p>
	                            </c:if>
	                     
	                            <!-- 아이디 중복 아닐때 -->
								<c:if test="${not empty successMessage}">
								    <p style="color: green">${successMessage}</p>
								</c:if> 
	    
								<%-- 	    <c:choose>
								    <c:when test="${not empty error}">
								        <!-- condition이 true일 때 실행 -->
								  <p style="color: red">${error}</p>
								      </c:when>
								    <c:otherwise>
								        <!-- condition이 false일 때 실행 -->
										 <p style="color: green">${successMessage}</p>
								    </c:otherwise>
								</c:choose> --%>								
								
								<div class="input-group">
									<p>비밀번호</p>
									<input type="password" id="user_pw" name="user_pw" class="form-control">
								</div>
								<div class="input-group">
									<p>비밀번호 확인</p>
									<input type="password" id="ckuser_pw" class="form-control">
								</div>
								<div class="chPw">
									<!-- 요기에 비밀번호랑 비밀번호 확인이랑 안맞으면 빨간글씨로 비밀번호 확인해달라고 글 뜨게 -->
								</div>
								<div class="input-group">
									<p>이름</p>
									<input type="text" id="user_name" name="user_name" class="form-control">
								</div>
								<div class="input-group">
									<p>닉네임</p>
									<input type="text" id="user_nick" name="user_nick" class="form-control">
								</div>
								<div class="input-group">
									<p>이메일</p>
									<input type="text" id="user_email" name="user_email" class="form-control">
								</div>
								<div class="input-group">
									<p>전화번호</p>
									<input type="text" id="user_phone" name="user_phone" class="form-control">
								</div>
								<div class="submit-group">
									<input type="submit" value="회원가입">
								</div>
							</form>								
						</section>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Footer -->
	<section id="footer">
		<div class="container">
			<div class="row">
				<div class="col-8 col-12-medium">
				</div>
				<div class="col-4 col-12-medium imp-medium">
				</div>
			</div>
		</div>
	</section>
</div>
	

<!-- <script>

     		var form = document.inputForm;
     		
     		if(!form.user_id.value){
     			alert("아이디를 입력해주세요");
     			form.user_id.focus();
     			return;
     		}
     		if(!form.user_pw.value){
     			alert("비밀번호를 입력해주세요");
     			form.password.focus();
     			return;
     		}
     		if(form.user_pw.value != form.ckuser_pw.value){
                alert("비밀번호를 확인해주세요.");
                form.password.focus();
                return;
             }
     		if(!form.user_name.value){
     			alert("이름을 입력해주세요");
                form.user_name.focus();
     			return;
     		}
     		if(!form.user_nick.value){
     			alert("닉네임을 입력해주세요");
                form.user_nick.focus();
     			return;
     		}
     		if(!form.user_phone.value){
     			alert("전화번호를 입력해주세요");
                form.user_phone.focus();
     			return;
     		}
     		if(!form.user_email.value){
     			alert("이메일를 입력해주세요");
                form.user_email.focus();
     			return;
     		}
     		 if($('#result').text()!='사용가능한 아이디입니다.'){
                 alert("아이디 중복확인해주세요.");
                 form.user_id.focus();
                 return;
               }
    
            form.submit();
            
         
         
         </script> -->
</body>
</html>