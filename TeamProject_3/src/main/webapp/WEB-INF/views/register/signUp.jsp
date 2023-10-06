<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel=stylesheet href=../inc/signUp.css>

<main>
<div id="signUp-form">
	<h2>회원가입 폼</h2>
	
	<form action="UserInsert" method="POST">
	    <table>
	    	<tr>
	    		<td>아이디</td> 
	    		<td><input type="text" id="u_id" name="u_id" required></td>
	    		<td><span id="idStatus"></span></td> <!-- 중복 체크 결과 메시지 표시 -->
                <td>&nbsp;<button type="button" onclick="checkDuplicate();">중복 확인</button></td>
	    	</tr>
	    	
	    	<tr>
	    		<td>비밀번호</td>
	    		<td><input class = "password2_reg" type="password" id="u_pw" name="u_pw" required autocomplete="new-password"></td>
	    	</tr>
	    	
	    	<tr>
	    		<td>비밀번호확인</td>
	    		<td><input class="password2_ok" type="password" id="confirm_pw" name="confirm_pw" required autocomplete="new-password"></td>
	    	</tr>
	    	
	    	<tr>
	    		<td>이메일</td>
	    		<td><input type="email" id="u_email" name="u_email" required></td>
	    	</tr>
	    	
	    	<tr>
	    		<td>휴대폰 번호</td>
	    		<td><input type="tel" id="u_phone" name="u_phone" required></td>
	    	</tr>
	    	
	    	<tr>
	    		<td>이름</td>
	    		<td><input type="text" id="u_name" name="u_name" required></td>
	    	</tr>
	    	
	    	<tr>
	    		<td>생년월일</td>
	    		<td><input type="text" id="u_birthdate" name="u_birthdate" placeholder="YYYY-MM-DD" required></td>
	    	</tr>
	    	
	    	<tr>
	    		<td>성별</td>
	    		<td>
		    		<input type="radio" id="male" name="u_gender" value="M"><span>남성</span>
		    		<input type="radio" id="female" name="u_gender" value="F"><span>여성</span>
	    		</td>
	    	</tr>
	    </table>
	    <!-- <label for="username">
	    아이디:
	    <input type="text" id="u_id" name="u_id" required>
	    </label>
	
	    <label for="password">
	    비밀번호:
	    <input type="password" id="u_pw" name="u_pw" required>
	    </label>
	
	    <label for="confirm_password">
	    비밀번호 확인:
	    <input type="password" id="confirm_pw" name="confirm_pw" required>
	    </label>
		
		
	    <label for="email">
	    이메일:
	    <input type="email" id="u_email" name="u_email" required>
	    </label>
	
	    <label for="phone">
	    휴대폰 번호:
	    <input type="tel" id="u_phone" name="u_phone" required>
	    </label>
	
	    <label for="name">
	    이름:
	    <input type="text" id="u_name" name="u_name" required>
	    </label>
	
	    <label for="birthdate">
	    생년월일:
	    <input type="text" id="u_birthdate" name="u_birthdate" placeholder="YYYY-MM-DD" required>
	    </label>
	
	    <label>성별</label>
	    
		<label>남성<input type="radio" id="male" name="u_gender" value="M"></label>
		<label>여성<input type="radio" id="female" name="u_gender" value="F"></label> -->
	    <button type="submit" id="signUpButton">가입하기</button>
	</form>
</div>
<script>
//플래그변수
var r1 = false;
var r2 = false;
var r3 = false;

function enableOrDisableSignUpButton() {
    if (r1 && r2 && r3) { // 모든 체크 조건을 만족하면 버튼 활성화
        enableSignUpButton();
    } else { // 하나라도 만족하지 않으면 버튼 비활성화
        disableSignUpButton();
    }
}
//버튼 활성화 함수
function enableSignUpButton() {
    $('input[type="submit"]').prop('disabled', false);
}

// 버튼 비활성화 함수
function disableSignUpButton() {
    $('input[type="submit"]').prop('disabled', true);
}
// 비밀번호 확인
function checkPassword2() {
	   var password = $('#u_pw').val();
	    var password2 = $('#confirm_pw').val();

	    if (password != password2) {
	        $('.password2_reg').css("display", "inline-block");
	        $('.password2_ok').css("display", "none");
	    } else {
	        $('.password2_ok').css("display", "inline-block");
	        $('.password2_reg').css("display", "none");
	        r3 = true;
	    }
	    enableOrDisableSignUpButton();
	}

// 아이디 유효성검사 및 중복 체크
function checkDuplicate() {
var signUpButton = document.getElementById("signUpButton"); 
    var uId = document.getElementById("u_id").value;
    if (uId == "") {
        alert("아이디를 입력하세요.");
        return false;
    }
    
    var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
    if (!isID.test(uId)) {
        alert("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
        return false;
    }
    $.ajax({
        url: "CheckId",
        method: "POST",
        data: { u_id: uId },
        success: function (result) {
            if (result!=uId) {
                // 중복되는 아이디가 없는 경우
                alert("멋진 아이디네요!");
            } else {
                // 중복되는 아이디가 있는 경우
                alert("이미 사용 중인 아이디입니다");
                
            	disableSignUpButton() // 회원가입 버튼 비활성화
                //signUpButton.addEventListener("click", function () {
                  //  alert("아이디 중복체크 여부를 확인해주세요")
                //});
            }
        },
        error: function () {
            alert("아이디 중복 체크 중 오류가 발생했습니다.");
        }
        // 회원가입 버튼 클릭시 수행되어야 할 것들 실행
        //signUpButton.addEventListener("click", function (){
        //	checkPassword2();
       // }
    });
    return false; // 폼 제출을 막기 위해 false 반환
}
</script>
</main>
