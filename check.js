function joinCheck(){
	if (document.frm.stname.value.length==0){
	alert("학생 성명이 입력되지 않았습니다.");
	frm.custname.focus();
	return false;	
	}
	if (document.frm.dept.value.length==0){
	alert("학생 과가 입력되지 않았습니다.");
	frm.phone.focus();
	return false;	
	}
	if (document.frm.hp.value.length==0){
	alert("학생 휴대폰가 입력되지 않았습니다.");
	frm.address.focus();
	return false;	
	}
	if (document.frm.local.value.length==0){
	alert("학생 지역이 입력되지 않았습니다.");
	frm.joindate.focus();
	return false;	
	}
	if (document.frm.address.value.length==0){
	alert("학생 주소가 입력되지 않았습니다.");
	frm.grade.focus();
	return false;	
	}
	success();
	return true;
}
function success(){
	alert("회원등록이 완료되었습니다.");	
}

function search(){
window.location	="list.jsp";
}

function modify(){
	alert("학생정보 수정이 완료되었습니다.");	
	}