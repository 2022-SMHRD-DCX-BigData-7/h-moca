<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAKETUBE</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="${cpath}/resources/css/main.css">
<style>
	#content {
		padding: 70px;
	}
	
	.input-group{
		margin: 20px 20px;
	}

	.input-group>p{
		margin: 0 0 0 0;
	}

	.input-group>input{
		border-radius: 5px;
		border: solid 1px #d6ddd8;
		width: 100%
	}

	.form-control{
		width: 100%;
	}
	
	#login {
		background: #ffffff;
		padding: 40px 30px 40px 30px;
		border: solid 1px #d6ddd8;
		border-radius: 5px;
	}

	#login h2{
		text-align: center;
	}

	#login a{
		color: #373f42;
		font-size: 15px;				
	}

	.notyet {
		text-align: right;
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
</style>
<script>
	function checkField(){
		var inputs = document.inputForm;
		
		if(!inputs.user_id.value){
			alert("아이디를 입력해주세요");
			return false;
		}
		if(!inputs.user_pw.value){
			alert("비밀번호를 입력해주세요");
			return false;
		}
	}
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
						<section id="login">
							<header>
								<h2>로그인</h2>
							</header>
							<form action="${cpath}/UserLogin.do" method='post' name="inputForm" onsubmit="return checkField();">
								<div class="input-group">
									<p>아이디</p>
									<input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디를 입력하세요.">
								</div>
								<div class="input-group">
									<p>비밀번호</p>
									<input type="password" id="user_pw" name="user_pw" class="form-control" placeholder="비밀번호를 입력하세요.">
								</div>
								<div class="input-group">
									<input type="submit" value="로그인">
								</div>
							</from>
							<div class="notyet">
								<a href="#">아직 회원이 아니신가요?</a>
							</div>
						</section>

				</div>
			</div>
		</div>
	</section>
		
</div>

 <a href="javascript:kakaoLogin();"><img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height:60px;width:auto;""></a>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        //e4c77f92564e5cf41fff7c7bfface8d2
        window.Kakao.init("e4c77f92564e5cf41fff7c7bfface8d2");

        window.Kakao.init("ER6c83UTcMPZD-s-zrX0mvftmfPG4O_9E_RnxOun12cjOGlqGHq37E17zsgKKiUOAAABi0cNO_oq3eF1vjqPRg");
        
        function kakaoLogin() {
            window.Kakao.Auth.login({
            scope:'profile_nickname, profile_image, account_email',
            success: function(authObj){
                console.log(authObj); //로그인됨
                window.Kakao.API.request({ //로그인 정보 가져올거임
                    url:'/v2/user/me', //url이 로그인한 사용자의 정보를 가져와줌
                    success: res () {
                        const kakao_account = res.kakao_account;
                        console.log(kakao_account);
                    }
                });
            }
        }
            );
        }

    </script>
	
<!-- Scripts -->
<script src="${cpath}/resources/js/jquery.min.js"></script>
<script src="${cpath}/resources/js/browser.min.js"></script>
<script src="${cpath}/resources/js/breakpoints.min.js"></script>
<script src="${cpath}/resources/js/util.js"></script>
<script src="${cpath}/resources/js/main.js"></script>
	
</body>
</html>