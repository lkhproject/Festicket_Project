/**
 * 
 */

 function joinCheck() {
  var userId = document.join_frm.userId.value;
  var userPassword = document.join_frm.userPassword.value;
  var userPasswordCheck = document.join_frm.userPassword_check.value;
  var name = document.join_frm.name.value;
  var email = document.join_frm.email.value;
  var userPhone = document.join_frm.userPhone.value;

  // 아이디 유효성 검사
  if (userId.length < 4 || userId.length > 12) {
    alert("아이디는 4자 이상, 12자 이하로 입력해주세요.");
    return false;
  }

  // 비밀번호 유효성 검사
  if (userPassword.length < 4 || userPassword.length > 12) {
    alert("비밀번호는 4자 이상, 12자 이하로 입력해주세요.");
    return false;
  }

  // 비밀번호 확인 유효성 검사
  if (userPassword !== userPasswordCheck) {
    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
    return false;
  }

  // 이름 유효성 검사
  var nameRegex = /^[a-zA-Z가-힣]{2,20}$/;
  if (!nameRegex.test(name)) {
    alert("이름은 한글 또는 영문으로 2자 이상, 20자 이하로 입력해주세요.");
    return false;
  }

  // 이메일 유효성 검사
  var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
  if (!emailRegex.test(email)) {
    alert("유효한 이메일 주소를 입력해주세요.");
    return false;
  }

  // 휴대폰 번호 유효성 검사
  var phoneRegex = /^\d{10,11}$/;
  if (!phoneRegex.test(userPhone)) {
    alert("휴대폰 번호는 숫자로 10자 또는 11자로 입력해주세요.");
    return false;
  }

  // 모든 유효성 검사 통과
  return true;
}