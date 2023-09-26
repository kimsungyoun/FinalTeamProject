
<%--
  Created by IntelliJ IDEA.
  User: user07
  Date: 2023-09-18
  Time: 오후 5:36
  To change this template use File | Settings | File Templates.
--%>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	.social-login{
		margin-top:30px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
    .login-wrapper{
        width: 400px;
        height: 350px;
        padding: 40px;
        box-sizing: border-box;
    }

    .login-wrapper > h2{
        font-size: 24px;
        color: #6A24FE;
        margin-bottom: 20px;
    }
    #login-form > input{
        width: 100%;
        height: 48px;
        padding: 0 10px;
        box-sizing: border-box;
        margin-bottom: 16px;
        border-radius: 6px;
        background-color: #F8F8F8;
    }
    #login-form > input::placeholder{
        color: #D2D2D2;
    }
    #login-form > input[type="submit"]{
        color: #fff;
        font-size: 16px;
        background-color: #6A24FE;
        margin-top: 20px;
    }

    #login-form > input[type="checkbox"]{
        display: none;
    }
    #login-form > label{
        color: #999999;
    }
    #login-form input[type="checkbox"] + label{
        cursor: pointer;
        padding-left: 26px;
        background-repeat: no-repeat;
        background-size: contain;
    }
    #login-form input[type="checkbox"]:checked + label{
        background-repeat: no-repeat;
        background-size: contain;
    }
</style>
<main>
	<div class="login-wrapper">
	    <h2>Login</h2>
	    <form method="post" action="loginOk" id="login-form">
	        <input type="text" name="u_id" placeholder="Email">
	        <input type="password" name="u_pw" placeholder="Password">
	        <label for="remember-check">
	            <input type="checkbox" id="remember-check">아이디 저장하기
	        </label>	        
	        <input type="submit" value="Login">
	    </form>
	        <div class="user-actions">
	            <a href="/smhrd/register/idsearch"><button>아이디찾기</button></a>
	            <a href="/smhrd/register/pwsearch"><button>비밀번호찾기</button></a>
	            <a href="/smhrd/register/signUp"><button>회원가입</button></a>
	        </div>
			<div class="social-login">
			<a href="javascript:void(0)" onclick="kakaoLogin();">
				<img src="<%= request.getContextPath() %>/img/kakao_login.png" alt="카카오 로그인">
			</a>

			<!--     <li onclick="kakaoLogout();">
                    <a href="javascript:void(0)">
                        <span>카카오 로그아웃</span>
                    </a>
                </li> -->
			<%--구글 api--%>

			<a id="g_id_onload" data-client_id="509029365873-e1n6bo3edjb0h0brf50dl08hfpf2dj4s.apps.googleusercontent.com" data-login_uri="/index" data-auto_prompt="false"></a>



			<a class="g_id_signin" data-type="standard" data size="large" data-theme="outline" data-text="sign_in_with" data-shape="rectangular" data-logo_alignment="left"></a>


				<!-- 네이버 로그인 버튼 노출 영역 -->
			<a id="naver_id_login"></a>
		</div>
	</div>

</main>

<script>
    function handleCredentialResponse(response) {
        console.log("Encoded JWT ID token: " + response.credential);
    }
    window.onload = function () {
        google.accounts.id.initialize({
            client_id: "509029365873-e1n6bo3edjb0h0brf50dl08hfpf2dj4s.apps.googleusercontent.com",
            callback: handleCredentialResponse
        });
        google.accounts.id.renderButton(
            document.getElementById("buttonDiv"),
            { theme: "outline", size: "large" }  // customization attributes
        );
        google.accounts.id.prompt(); // also display the One Tap dialog
    }
</script>

<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
    Kakao.init('6a20bba2a1975a5c919ed9036f3180cc'); //발급받은 키 중 javascript키를 사용해준다.
    console.log(Kakao.isInitialized()); // sdk초기화여부판단
    //카카오로그인
    function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                        console.log(response)
                        window.location.href = '/smhrd/register/loginOk'; // loginOk로 이동
                    },
                    fail: function (error) {
                        console.log(error)
                    },
                })
            },
            fail: function (error) {
                console.log(error)
            },
        })
    }
    //카카오로그아웃
    function kakaoLogout() {
        if (Kakao.Auth.getAccessToken()) {
            Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (response) {
                    console.log(response)
                },
                fail: function (error) {
                    console.log(error)
                },
            })
            Kakao.Auth.setAccessToken(undefined)
        }
    }
</script>

<%--구글 로그인 api--%>
<script src="https://accounts.google.com/gsi/client" async defer></script>

<%--네이버 로그인 api--%>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


<!-- //네이버 로그인 버튼 노출 영역 -->
<script type="text/javascript">
    var naver_id_login = new naver_id_login("mF0_mZLB199s6Uv8BSyM", "http://localhost:8080/auth/naver/login/callback");
    var state = naver_id_login.getUniqState();
    naver_id_login.setButton("white", 2,40);
    naver_id_login.setDomain("/login");
    naver_id_login.setState(state);
    naver_id_login.setPopup();
    naver_id_login.init_naver_id_login();
</script>
