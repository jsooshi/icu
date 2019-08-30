

//log.js

function log(msg) {
	var console = document.getElementById("debugConsole");
	//디버그 : 프로그램 실행 중 변수가 갖는 값을 출력하기!!
	if (console != null) {
		console.innerHTML += msg +"<br/>";
	}
}
