/**
 * 
 */

 function joinCheck() {
	 
	 var isValid = true;
	 
	 if(document.join_frm.userId.value.length == 0) {
		 alert("아이디는 필수 입력사항입니다. 다시 확인해 주세요.");
		 isValid = false;
	 }
	 
	 else if(document.join_frm.userPassword.value.length == 0) {
		 alert("비밀번호는 필수 입력사항입니다. 다시 확인해 주세요.");
		 isValid = false;
	 }
	 
	 else if(document.join_frm.userPassword_check.value.length == 0) {
		 alert("비밀번호확인은 필수 사항입니다. 다시 확인해 주세요.");
		 isValid = false;
	 }
	 
	 else if(document.join_frm.userPassword.value != document.join_frm.userPassword_check.value) {
		 alert("비밀번호와 비밀번호 확인이 일치하지 않습니다. 다시 확인해 주세요.");
		 isValid = false;
	 }
	 
	 else if(document.join_frm.name.value.length == 0) {
		 alert("이름은 필수 입력사항입니다. 다시 확인해 주세요.");
		 isValid = false;
	 }
	 
	 else if(document.join_frm.email.value.length == 0) {
		 alert("이메일은 필수 입력사항입니다. 다시 확인해 주세요.");
		 isValid = false;
	 }
	 
	 else if(document.join_frm.userPhone.value.length == 0) {
		 alert("휴대폰 번호는 필수 입력사항입니다. 다시 확인해 주세요.");
		 isValid = false;
	 }
	 
	 return isValid;
	 
 }