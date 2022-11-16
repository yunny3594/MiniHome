var pop;
var options = 'top=50, left=100, width=400, height=400, status=no, menubar=no, toolbar=no, status=no';

function LoginPOP() {
	pop = window.open('/Login', 'popup', options);
}

function SignupPOP() {
	pop = window.open('/SignUp', 'popup', options);
}

function Login() {
	if ('input') {
		$('form').submit();
		alert(pop);
		window.open.close();

	} else {
		alert(pop);
		return;
	}
}

function Signup() {
	var idreg = /^[a-z0-9]{4,20}$/g;
	var pwreg = /^[a-z0-9]{4,20}$/g;
	var namereg = /^[ㄱ-ㅎ가-힣a-zA-Z]{0,20}$/;

	if (!idreg.test($("input[name=userid]").val())) {
		alert("아이디는 5~20자의 영문 소문자,숫자");
		return false;
	} else if (!pwreg.test($("input[name=userpw]").val())) {
		alert("비밀번호는 5~20자의 영문 소문자,숫자");
		return false;
	} else if (!namereg.test($("input[name=username]").val())) {
		alert("이릉은 20자 이하의 한글,영어");
		return false;
	} else if (!$("input[name=ilchon]").val()) {
		alert("일촌명 입력 필수");
		return false;
	}
	$("form").submit();
	alert(pop);
	window.open.close();
}
