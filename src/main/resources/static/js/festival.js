/**
 * 
 */

   function validateForm() {
    var selectElement = document.querySelector('select[name="orderOption"]');
    if (selectElement.value === "") {
      alert("정렬 옵션을 선택해주세요.");
      return false; // 제출을 막음
    }
    return true; // 폼 제출
  }