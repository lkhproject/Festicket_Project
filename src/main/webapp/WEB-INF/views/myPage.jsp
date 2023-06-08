<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페스티켓</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/myPage.css">
</head>
<body>
	<%@ include file="include/header.jsp" %>
	<div class="inner">
	<div class="quick_menu_wrap">
    <div class="title"><h2 class="title_txt">마이페이지</h2></div>
    <ul class="quick_menu_list">
        <li class="quick_menu_item">
            <a href="" class="quick_link">
                <div class="qmemu_box">
                    <span class="qmenu_tit">나의 예매권</span>
                </div>
            </a>
        </li>
        <li class="quick_menu_item_info">
            <a href="" class="quick_link">
                <div class="qmemu_box">
                    <span class="qmenu_tit">나의 회원정보</span>
                </div>
            </a>
        </li>
    </ul>
</div>
            <div class="help_cont">
<ul class="help_lmenu">
    <li class="has_sub">
        <span class="help_submenu_tit">예매관리</span>
        <ul class="help_submenu">
            <li>
                <a href="">예매확인/취소</a>
            </li>
        </ul>
    </li>
    
    <li class="has_sub">
        <span class="help_submenu_tit">할인혜택</span>
        <ul class="help_submenu">
            <li>
                <a href="">예매권</a>
            </li>
        </ul>
    </li>
    
    <li class="has_sub">
        <span class="help_submenu_tit">활동관리</span>
        <ul class="help_submenu">
            <li>
                <a href="" class="my_lmenu32"> 후기 </a>
            </li>
        </ul>
    </li>

    <li class="has_sub">
        <span class="help_submenu_tit">회원정보관리</span>
        <ul class="help_submenu">
            <li class="on">
                <a href="" class="my_lmenu52">회원정보수정</a>
            </li>
            <li>
                <a href="" class="my_lmenu53">회원탈퇴</a>
            </li>
        </ul>
    </li>
</ul>      
	</div>

<div class="help_rcont">
                    <div class="h3_line"><h4 class="tit_reserve01">예매확인/취소</h4></div>
                    <div class="guide_txt">
                    <p class="guide_txt">
                        <span class="color_point">예매번호</span>를 클릭하면 예매 상세 내용을 확인할 수 있습니다.
                        <br>공연/전시 예매 내역은 하단의 공연/전시 탭을 선택하면 확인할 수 있습니다.
                    </p>
                    </div>
                    <div class="sortbx">
                        <dl class="daysortbx fl">
                            <dt>기간별 조회</dt>
                            <dd>
                                <ul class="daysort">
                                   <li ng-repeat="period in periodList" ng-class="{'on' : period.name == search.period.name}" class="ng-scope">
                                        <a href="" ng-click="periodSelection.select(period)" class="ng-binding">15일</a>
                                    </li><li ng-repeat="period in periodList" ng-class="{'on' : period.name == search.period.name}" class="ng-scope on">
                                        <a href="" ng-click="periodSelection.select(period)" class="ng-binding">1개월</a>
                                    </li><li ng-repeat="period in periodList" ng-class="{'on' : period.name == search.period.name}" class="ng-scope">
                                        <a href="" ng-click="periodSelection.select(period)" class="ng-binding">2개월</a>
                                    </li><li ng-repeat="period in periodList" ng-class="{'on' : period.name == search.period.name}" class="ng-scope">
                                        <a href="" ng-click="periodSelection.select(period)" class="ng-binding">3개월</a>
                                    </li>
                                </ul>
                            </dd>
                        </dl> 
                    </div>
					<br><br><br><br>
                    <p class="guide_text">예매한 내역이 확인이 안되실 경우 <a href="" class="color_point">1:1 상담 문의</a>를 이용해주세요.</p>
					<br>
					<div class="container" >
                    <div class="basic_tbl basic_tbl_v3">
                      <table class="table table-striped">
  				<thead>
 					<tr>
      				<th scope="col">예매번호</th>
      				<th scope="col">티켓명</th>
      				<th scope="col">관람일시</th>
      				<th scope="col">매수</th>
      				<th scope="col">취소가능일</th>
      				<th scope="col">상태</th>
      				</tr>
      			</thead>
   				 <tbody>
                    <tr ng-show="reserveList.length === 0">
                    <td colspan="6" class="no_data">예매한 내역이 없습니다.</td>
                    </tr>
                 </tbody>
				</table>
					</div>
					</div>
                	</div>
  					</div>
	
	<%@ include file="include/footer.jsp" %>
</body>

</html>