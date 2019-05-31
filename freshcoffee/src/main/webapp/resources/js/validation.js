var joinVaildate = {
		//결과메시지 출력시 사용하는 Text
		resultCode : {
			empty_val : {
				code : 1,
				desc : '필수입력 정보입니다.'
			},
			space_length_val : {
				code : 2,
				desc : '공백없이 입력해주세요.'
			},
			
			//ID
			success_id : {
				code : 0,
				desc: '멋진 아이디네요'
			},
			invalid_id: {
				code : 3,
				desc : '올바른 ID를 입력해주세요'
			},
			length_id : {
				code : 4,
				desc: 'ID는 공백없이 6자 이상이여야 합니다'
			},
			overlap_id : {
				code : 5,
				desc : '이미 사용 중인 ID 입니다. '
			},
			
			//PW
			success_pw : {
				code : 0,
				desc : '사용가능한 비밀번호 입니다'
			},
			invalid_pw : {
				code : 3,
				desc : '올바른 비밀번호(4~12자)를 입력해주세요.'
			},
			other_pw : {
				code : 4,
				desc : '입력하신 비밀번호가 일치 하지 않습니다.'
			},
			
			//name
			success_name : {
				code : 0,
				desc : '멋진 이름이네요:)'
			},
			invalid_name : {
				code : 3,
				desc : '이름은 표준한글만 입력가능합니다.'
			},
			length_name : {
				code : 4,
				desc : '이름은 2자이상 ~ 4자이하만 가능합니다.'
			},
			
			// phone 
			success_phone : {
				code : 0,
				desc : '사용가능한 번호입니다.'
			},
			invalid_phone: {
				code : 3,
				desc : '휴대폰 번호가 유효하지 않습니다.'
			},
			number_phone : {
				code : 4,
				desc : '숫자만 입력해주세요.'
			},
			length_phone : {
				code : 5,
				desc: '(-)없이 10, 11자로 입력해주세요.'
			},
			
			// email
			success_email : {
				code : 0,
				desc : '사용가능한 이메일입니다'
			},
			invalid_email : {
				code : 3,
				desc : '올바른 이메일을 입력해주세요.'
			}
		},
		
		checkId : function(memId){
			var regEmpty = /\s/g; //공백문자
			var reg = /[^a-z0-9-_.]+/g; //올바른 아이디 형식
			
			//4.member.jsp에서 전달한 매개변수memId로 
			//	유효성 체크 시작
			//	1) null값 체크				if
			//	2) 값 사이의 공백값 체크		else if
			//	3) 유효한 값인지 체크(정규식)	else if	
			//	4) 6자~50자 이내 길이 체크		else if
			//	5) 성공: 유효한 값(중복유무 X)  else
			if(memId == "" || memId.length == 0 ){
				return this.resultCode.empty_val;
			} else if(memId.match(regEmpty)){
				return this.resultCode.space_length_val;
			} else if(reg.test(memId)){
				return this.resultcode.invalid_id;
			} else if(memId.length < 5 || memId.length > 10) {
				return this.resultcode.length_id;
			} else {
				// 5. 입력받은 값이 위의 유효성체크 4단계를 통과
				//	     위의 유효성체크 4단계를 통과
				//	     하지만 중복된 ID인지 검정필요함
				//	  6.return 결과값으로 success_id(code, desc)를
				//		호출한 곳으로 전송!
				//		>>> code:0, desc: '멋진 아이디네요
				return this.resultCode.success_id;
			}
			//id
			// 1) null
			// 2) 정규식
			// 3) 중복체크
			
			// id에 값이 있는 경우에만 ajax 동작!
		},
			
			checkPw : function(memPw,memRpw){
				var regEmpty = /\s/g; //공백문자
				var pwReg = RegExp(/^[a-zA=Z0-9]{4,12}$/); //비밀번호 체크
				
				if(memPw == "" || memPw.length == 0 ){
					return this.resultCode.empty_val;
				} else if(memPw.match(regEmpty)){
					return this.resultCode.space_length_val;
				}else if(!pwReg.test(memPw)){
					return this.resultCode.invalid_pw;
				}else {					
					return this.resultCode.success_pw;
				}
			}
		}


//ID 중복체크
function ajaxCheck(memId){
	//10. ajax 시작!
	//	    목적지: idcheck.freshcoffee
	//	     전달데이터: 이름표가 id인 memId 데이터
	//	     데이터 포장 방법: json
	//	     데이터 전달방법: POST방식
	// 	     결론: web.xml 이동

	$.ajax({
		url: "idCheck.freshcoffee",
		type: "POST",
		dataType: "json",
		data: "id="+memId,
		success: function(data) {
			//29.Action단에서 전송한  message, id를
			// data 매개변수로 받음
//			   30. data.message의 값이 -1이면 => 중복 메시지 출력
//			       data.message의 값이 1이면 사용가능함
			if(data.message == "-1"){
				$(".error_next_box").eq(0).text("이미 사용 중인 아이디가 있어요")
										  .css("display", "block")
										  .css("color", "#FF3636");
				return "-1";
			} else {
				$(".error_next_box").eq(0).text("멋진 아이디인것 같아요!")
										  .css("display", "block")
										  .css("color", "#0000FF");
				return "1";
			}
		},
		error: function(){
			alert("System Error!!!");
		}
	});
}

	
