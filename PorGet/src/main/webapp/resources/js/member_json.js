

//  js폴더/member_json.js

//Member클래스 정의
/*
    클래스명 = function(){}
          -------------
                        생성자함수정의!!
 */ 

//Member2클래스(=울타리) 정의
Member2 = function(name,id,securityNo) {
   //클래스의 속성정의   : this.속성명	
   //(=클래스 멤버변수)
   this.name=name;
   this.id=id;
   this.securityNo=securityNo;
} 
//클래스안에 메소드(함수)정의  : 키워드 prototype 사용
/*
   클래스명.prototype.a함수명 = function(){}
   클래스명.prototype.b함수명 = function(){}
   클래스명.prototype.c함수명 = function(){}
   
  ==> JSON으로 변환 
   클래스명.prototype={
                     a함수명:function(){},
                     b함수명:function(){},
                     c함수명:function(){}
                  };

*/

Member2.prototype={
		setName : function(name){
			        this.name=name;
		          }
        ,
        setId   : function(id){
        	         this.id=id;
                  }
        ,
        setValue: function(name,id,securityNo){
		        	this.name=name;
		        	this.id=id;
		        	this.securityNo=securityNo;
                  }
         ,
         getAge: function(){//function getAge(){}와 같은 의미
        		var birthYear;//1996
        		    birthYear = parseInt(this.securityNo.substr(0,2));
        	    var code;//2
        	        code = this.securityNo.charAt(7);// '2'
        	    birthYear = (code < '3') ?  1900+birthYear : 2000+birthYear;
        	    var year = new Date().getFullYear();//현재년도 구하기 (2019)
        	    return year-birthYear+1;
               }//getAge
         ,
         toString : function(){//toString()함수 정의
        		      return "[이름:"+this.name+", 아이디:"+this.id+"]"
                    }
};













