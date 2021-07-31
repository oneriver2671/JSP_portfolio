
/* jQuery */
$(document).ready(function(){
  $('.header_level2, #header_box').hide();

  $('#navbar').mouseover(function(){
    $('.header_level2, #header_box').fadeIn(500);
  });
  $('#navbar, #header_box').mouseleave(function(){
    $('.header_level2, #header_box').fadeOut(500);
  });
});


/* -------- 회원가입 버튼 클릭 -------- */
function join_btn(){
  var joinForm = document.getElementsByName("joinForm");
  joinForm.action("join_result.jsp");
  
}


/* -----------회원가입 버튼 클릭 시 ----------- */
function join(){
  // 이 함수 return 만나서 강제로 끝내게 만들어보자. 
  var temp = 0;  // 값이 제대로 입력될 때마다 ++

  /* 변수 설정 */
  var input_text = document.querySelectorAll("input[type='text']");
  
  // 이름, 아이디
  var nameValue = input_text[0].value;
  var idValue = input_text[1].value;
  var nameLength = input_text[0].value.length;
  var idLength = input_text[1].value.length;
  
  // 비밀번호
  var input_pwd = document.querySelectorAll("input[type='password']");
  var pwdValue = input_pwd[0].value;
  var pwdLength = input_pwd[0].value.length;
  var pwdValue_check = input_pwd[1].value;

  // 생년월일
  var birth_year = document.getElementsByName("birth_1")[0].value;
  var birth_month = document.getElementsByName("birth_2_1")[0].value;
  var birth_day = document.getElementsByName("birth_2_2")[0].value;
  
  // 성별
  var gender_radio = document.getElementsByName("gender");
  var gender;
  if(gender_radio[0].checked){
    gender = gender_radio[0].value;
  } else{
    gender = gender_radio[1].value;
  }

  // 연락처
  var tel_sort = document.getElementsByName("tel_sort")[0].value;
  var tel_front = document.getElementsByClassName("tel_first")[0].value;
  var tel_middle = input_text[2].value;
  var tel_back = input_text[3].value;

  // 이메일
  var mail_front = input_text[4].value;
  var mail_back = input_text[5].value;

  // 주소
  var addNum = input_text[6].value;
  var add = input_text[7].value;
  var add_value;
  if(add == ''){
    add_value="미입력";
  } else{
    add_value= add +" ("+addNum+")";
  }
  
  // 이메일, SMS 수신여부
  var mail_ok;
  var sms_ok;
  var mailOK_radio = document.getElementsByName("mailOK");
  for(var i=0; i<mailOK_radio.length; i++){
    if(mailOK_radio[i].checked){
      mail_ok = mailOK_radio[i].value;
    }
  }
  var smsOK_radio = document.getElementsByName("sms_ok");
  for(var i=0; i<smsOK_radio.length; i++){
    if(smsOK_radio[i].checked){
      sms_ok = smsOK_radio[i].value;
    }
  }

  /*---- 입력값 확인 ----*/
  // if(nameLength == 0){
  //   alert("이름을 입력하세요.");
  //   input_text[0].focus();
  // } else if(nameLength>=6){
  //   alert("이름은 5자 이하로 입력하세요.");
  //   input_text[0].focus();
  // } else{
  //   temp++;     // temp 0->1
  //   // 아이디
  //   if(idLength == 0){
  //     alert("id를 입력하세요.");
  //     input_text[1].focus();
  //   } else if(idLength<6){
  //     alert("id를 6자 이상 입력하세요.");
  //     input_text[1].focus();
  //   }
  //   else if(idLength>15){
  //     alert("id는 15자 이하로 입력하세요.");
  //     input_text[1].focus();
  //   } else{
  //     temp++;     // temp 1->2

  //     // 비밀번호
  //     if(pwdLength == 0){
  //       alert("패스워드를 입력하세요.");
  //       input_pwd[0].focus();
  //     } else if(pwdLength<9){
  //       alert("패스워드를 9자 이상 입력하세요.");
  //       input_pwd[0].focus();
  //     } else{
  //       if(pwdValue !== pwdValue_check){
  //         alert("비밀번호 확인 값이 일치하지 않습니다.");
  //         input_pwd[1].focus();
        
  //       } else{
  //         temp++;      // temp 2->3

  //         // 연락처
  //         if(tel_middle.length==0 || tel_back.length==0){
  //           alert("연락처를 입력해주세요.");
  //         }else{
  //           temp++;      // temp 3->4
  //           // 이메일 주소
  //           if(mail_front.length==0 || mail_back.length==0){
  //             alert("이메일 주소를 입력해주세요.");
  //           }else{
  //             temp++;       // temp 4->5
  //           }
  //         }  
  //       }
  //     }
  //   }
  // }

  // temp가 5가 되어야만 모든게 잘 입력된 상황임.
 

  var joinForm = document.getElementsByName("joinForm");
  joinForm.action("join_result.jsp");

  // if(temp == 5){
  //   joinForm.action("join_result.jsp");
  // }
}


/* 어떤게 더 좋을지. */
// 메일 뒷주소 선택하는 함수.
function mailSelect(){
  if(joinForm.mail_choice[0].selected){
    joinForm.mail_back.value='';
  }
  else{
    joinForm.mail_back.value = joinForm.mail_choice.value;
  }
}

// 위의 함수 dom script 방식으로 써보기.
function mailSelect_02(){
  var mail_choice = document.getElementsByName("mail_choice");
  var mail_back = document.getElementsByName("mail_back");

  if(mail_choice[0].value==="직접 입력"){
    mail_back[0].value='';          // 이걸 해결해야 함.
  } else{     
  mail_back[0].value = mail_choice[0].value;    
  }

}

/* -------------- 우편번호 찾기 ---------------- */
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample6_execDaumPostcode() {
  new daum.Postcode({
      oncomplete: function(data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var addr = ''; // 주소 변수
          var extraAddr = ''; // 참고항목 변수

          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
          if(data.userSelectedType === 'R'){
              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                  extraAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if(extraAddr !== ''){
                  extraAddr = ' (' + extraAddr + ')';
              }
              // 조합된 참고항목을 해당 필드에 넣는다.
              document.getElementById("sample6_extraAddress").value = extraAddr;
          
          } else {
              document.getElementById("sample6_extraAddress").value = '';
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('sample6_postcode').value = data.zonecode;
          document.getElementById("sample6_address").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("sample6_detailAddress").focus();
      }
  }).open();
}