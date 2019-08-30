var xhr = null;


function getXMLHttpRequest() { //XMLHttpRequest객체생성함수
	if (window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch(e) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch(e1) { return null; }
		}
	} else if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else {
		return null;
	}
}

function sendRequest(url, params, callback, method) {//사용자 정의 함수
	xhr = getXMLHttpRequest();//xhr: 비동기 서버통신 객체!!
	var httpMethod = method ? method : 'GET';
	if (httpMethod != 'GET' && httpMethod != 'POST') {
		httpMethod = 'GET';
	}
	var httpParams = (params == null || params == '') ? null : params;
	var httpUrl = url;
	if (httpMethod == 'GET' && httpParams != null) {
		httpUrl = httpUrl + "?" + httpParams;
	}
	xhr.open(httpMethod, httpUrl, true);
	xhr.setRequestHeader(
		'Content-Type', 'application/x-www-form-urlencoded');
        //웹서버에 전송할 컨텐트타입지정
	xhr.onreadystatechange = callback; //호출될 콜백함수 지정
	xhr.send(httpMethod == 'POST' ? httpParams : null);
        //HTTP요청방식이 POST이면 send()함수를 통해 파라미터 전송
}
