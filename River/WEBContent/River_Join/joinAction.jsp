<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 이거 js파일로 넘겨야하는데. 왜 js에선 안될까. (다른 함수들은 되는 것 같은데..?) -->
<script>
alert('테스트용');
// location.href = 'join.html';				// 다른 페이지로 이동.
// history.back();										// 이전 페이지로 이동.


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
  if(nameLength == 0){
    alert("이름을 입력하세요.");
    input_text[0].focus();
    history.back();	
  } else if(nameLength>=20){
    alert("이름은 20자 이하로 입력하세요.");
    input_text[0].focus();
    history.back();	
  } else{
    temp++;     // temp 0->1
    // 아이디
    if(idLength == 0){
      alert("id를 입력하세요.");
      input_text[1].focus();
      history.back();	
    } else if(idLength<6){
      alert("id를 6자 이상 입력하세요.");
      history.back();	
    }
    else if(idLength>15){
      alert("id는 15자 이하로 입력하세요.");
      history.back();	
    } else{
      temp++;     // temp 1->2

      // 비밀번호
      if(pwdLength == 0){
        alert("패스워드를 입력하세요.");
        history.back();	
      } else if(pwdLength<9){
        alert("패스워드를 9자 이상 입력하세요.");
        history.back();	
      } else{
        if(pwdValue !== pwdValue_check){
          alert("비밀번호 확인 값이 일치하지 않습니다.");
          history.back();	
       
        } else{
          temp++;      // temp 2->3

          // 연락처
          if(tel_middle.length==0 || tel_back.length==0){
            alert("연락처를 입력해주세요.");
            history.back();	
          }else{
            temp++;      // temp 3->4
            // 이메일 주소
            if(mail_front.length==0 || mail_back.length==0){
              alert("이메일 주소를 입력해주세요.");
              history.back();	
            }else{
              temp++;       // temp 4->5
            }
          }  
        }
      }
    }
  }

 //  temp가 5가 되어야만 모든게 잘 입력된 상황임.


 var joinForm = document.getElementsByName("joinForm");

  if(temp == 5){
   alert('회원가입이 완료되었습니다.');
   location.href('../River_Index/index.jsp');
    // joinForm.action("join_dbInput.jsp");    	// 입력된 값을 DB처리 페이지로 이동
  }

</script>
<body>

</body>
</html>