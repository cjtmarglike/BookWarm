﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="principal.username" var="user_id"/>
<!DOCTYPE html>
<html lang="kr">
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>Administrator</title>
   <meta name="keywords" content="HTML5 Template" />
   <meta name="description" content="BOOK & WARM">
   <meta name="author" content="bootstraptemplates.net">
   <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
   <link rel="shortcut icon" href="img/favicon.png" type="image/x-icon" />
   <link rel="apple-touch-icon" href="img/apple-touch-icon.png">

   <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,700|Cabin:400,600,700" rel="stylesheet">

   <!-- Vendor CSS -->
   <link rel="stylesheet" href="/warm/resources/VertexEx/vendor/tether/tether.min.css" />
   <link rel="stylesheet" href="/warm/resources/VertexEx/vendor/bootstrap/css/bootstrap.min.css">
   <link href="/warm/resources/Vertex/css/font-awesome.min.css" rel="stylesheet" />
   <link rel="stylesheet" href="/warm/resources/VertexEx/css/fonts/vertex-icons.css" />
   <link rel="stylesheet" href="/warm/resources/VertexEx/vendor/ion-icons/css/ionicons.min.css" />
   <link rel="stylesheet" href="/warm/resources/VertexEx/vendor/owl-carousel/owl.theme.css" />
   <link rel="stylesheet" href="/warm/resources/VertexEx/vendor/owl-carousel/owl.carousel.css" />
   <link rel="stylesheet" href="/warm/resources/VertexEx/vendor/menuzord/css/menuzord-animations.css" />
   <link rel="stylesheet" href="/warm/resources/VertexEx/vendor/lite-tooltip/css/litetooltip.css" />

   <link href="/warm/resources/VertexEx/vendor/dzsparallaxer/dzsparallaxer.css" rel="stylesheet" />
   <link href="/warm/resources/VertexEx/vendor/dzsparallaxer/dzsscroller/scroller.css" rel="stylesheet" />
   <link href="/warm/resources/VertexEx/vendor/dzsparallaxer/advancedscroller/plugin.css" rel="stylesheet" />

   <!-- Theme CSS -->
   <link href="/warm/resources/VertexEx/css/main.css" rel="stylesheet" />
   <link href="/warm/resources/VertexEx/css/main-shortcodes.css" rel="stylesheet" />
   <link href="/warm/resources/Vertex/css/header.css" rel="stylesheet" />
   <link href="/warm/resources/VertexEx/css/form-element.css" rel="stylesheet" />
   <link href="/warm/resources/VertexEx/css/animation.css" rel="stylesheet" />
   <link href="/warm/resources/VertexEx/css/font-icons.css" rel="stylesheet" /> 
   <link href="/warm/resources/Vertex/css/blog.css" rel="stylesheet" />
   <link href="/warm/resources/VertexEx/css/responsive.css" rel="stylesheet" />
   <link href="/warm/resources/VertexEx/css/utilities.css" rel="stylesheet" />
   <link href="/warm/resources/VertexEx/css/skins/default.css" rel="stylesheet" />
   <link href="/warm/resources/Vertex/css/style.css" rel="stylesheet" />

   <!-- Theme Custom CSS -->
   <link rel="stylesheet" href="/warm/resources/VertexEx/css/custom.css">

   <!-- Style Swicher -->
   <link href="/warm/resources/VertexEx/vendor/style-switcher/style-switcher.css" rel="stylesheet" />
   <link href="/warm/resources/VertexEx/vendor/style-switcher/bootstrap-colorpicker/css/bootstrap-colorpicker.css" rel="stylesheet" />

<script type="text/javascript" src="/warm/resources/js/admin.js"></script>
<script type="text/javascript" src="/warm/resources/js/DateJsonToJsp.js"></script>
<script type="text/javascript" src="/warm/resources/js/Criteria.js"></script>
<link rel="stylesheet" href="resources/css/main.css" />

</head>
<body class="v-bg-color">
<%@ include file="includes/header/header-topnav.jsp"%>
<div class="wrapper footer-wrap">
	<div class="page has-sidebar has-left-sidebar bordered" style="overflow:auto; overflow-x:hidden;">
		<div class="page-inner alternate-color">
			<div class="container">
				<div class="row">
					<div class="col-md-3 left-side-sidebar pt-70 viewHeight">
						<aside class="sidebar">
							<section class="sidebar-widget">
								<button class="administrator-BoardBtn btn sf-icon-stroke close"data-Action="administrator-board"> 게시판 관리 </button>
								<button class="administrator-UserBtn btn sf-icon-stroke close" data-Action="administrator-user"> 사용자 관리 </button>
								<button class="administrator-Userdelivery btn sf-icon-stroke close" data-Action="administrator-delivery"> 입금완료 </button>
							</section>
						</aside>
					</div>
				
					<!-- administrator-statistics -->
					<div class="col-md-9 right-side-sidebar pt-70 ">
						<!-- administrator-board -->
						<div id="administrator-board" class="administrator">
							<ul class="nav nav-pills sort-source" data-sort-id="portfolio" data-option-key="filter" data-plugin-options="{'layoutMode': 'masonry', 'filter': '*'}">
								<li id="communityLi"class="nav-item" data-option-value=".community"><a class="nav-link" href="#">Community Board</a></li>
								<li id="reviewLi"class="nav-item" data-option-value=".review"><a  class="nav-link" href="#">Review</a></li>
							</ul>
							<div class="sort-destination-loader sort-destination-loader-showing mt-4 pt-2">
								<div class="row portfolio-list sort-destination" data-sort-id="portfolio">
									<!-- Community Board -->
									<div class="isotope-item page-inner community">
										<section class="b-bordered">
											<div class="container">
												<div class="row justify-content-left">
													<div class="col-lg-8">
														<div class="pull-right" colspan="5">
															<h3 class="btn btn-sm">커뮤니티 삭제된 게시물 </h3>
														</div>
													<!-- 커뮤니티 테이블 -->
														<table id="delCommTable"class="table table-hover" style="table-layout:fixed;" >
														</table>
									
														<div class="post-meta-section clearfix">
															<div class="tag-cloud clearfix">
													<!-- 페이징 처리 -->
																<div class="row col-lg-12">
					     											<div class="panel-footer center communityPaging"></div>
					          									</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</section>
									</div>
									<!-- End Community Board -->
									
									<!-- Review Board -->
									<div class="isotope-item page-inner review">
										<section class="b-bordered">
											<div class="container">
												<div class="row justify-content-left">
													<div class="col-lg-8">
														<div class="pull-right" colspan="5">
															<h3 class="btn btn-sm">리뷰 보드 삭제된 게시물 </h3>
														</div>
													<!-- 리뷰 테이블 -->
														<table id="delReviewTable" class="table table-hover" style="table-layout:fixed;">
														</table>
									
														<div class="post-meta-section clearfix">
															<div class="tag-cloud clearfix">
													<!-- 페이징 처리 -->
																<div class="row col-lg-12">
					     											<div class="panel-footer center reviewPaging"></div>
					          									</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</section>
									</div><!-- End Review Board -->
								</div>
							</div>
						</div>
					<!-- End administrator-board -->
					
					
					<!-- administrator-user -->
						<div id="administrator-user" class="administrator">
							<ul class="nav nav-pills sort-source" data-sort-id="portfolio" data-option-key="filter" data-plugin-options="{'layoutMode': 'masonry', 'filter': '*'}">
								<li class="nav-item active" data-option-value="*"><a class="nav-link" href="#">Show All</a></li>
								<li class="nav-item" data-option-value=".authNum3"><a class="nav-link" href="#">관리자</a></li>
								<li class="nav-item" data-option-value=".authNum2"><a class="nav-link" href="#">매니저</a></li>
								<li class="nav-item" data-option-value=".authNum1"><a class="nav-link" href="#">사용자</a></li>
								<li class="nav-item" >
									<input type="text" class="nav-link"  style="text-transform: lowercase;" id="searchUser" name="searchUser" placeholder=" 사용자 검색"><button id="searchUserBtn"type="button" class="btn-sm nav-link" data-toggle="modal" data-target="#openUserInfo">검색</button>
								</li>
							</ul>
							<div class="sort-destination-loader sort-destination-loader-showing mt-4 pt-2">
								<div class="row portfolio-list sort-destination" data-sort-id="portfolio">
									<c:forEach items="${userList}" var="user">
									<div class="col-lg-4 isotope-item authNum${user.authList.size()}">
										<article class="v_blog-item v_blog-item-related v_blog-grid">
											<div class="v_blog-item-inner">
												<div class="v_blog-item-content">
													<div class="v_blog-item-header">
														<ul class="v_blog-item-meta">
															<li class="v_blog-item-date">
																<h2 class="v_blog-item-title" itemprop="name headline">${user.user_id}</h2>
															</li>
														</ul>
													</div>
													<div itemprop="articleBody">
														<div id="${user.user_id}_authenticationLevel" data-userid="${user.user_id}"data-username="${user.user_name}" data-userauth="${user.authList.size()}">
															<p class="v_blog-item-author"><span>user_name : ${user.user_name}</span></p>
															<c:if test="${user.authList.size()!=3}"><p class="v_blog-item-author"><span>권한 레벨 : 
																<select onchange="javascript:modifyUserAuthentication(this.options[this.selectedIndex].value)" name="authentication">
																    <option value=""> 레벨 ${user.authList.size()}</option>
																    <option value="ROLE_MANAGER">매니저(LV2)</option>
																    <option value="ROLE_USER">사용자(LV1)</option>
																</select>
																</span></p></c:if>
														</div>
													</div>
												</div>
											</div>
										</article>
									</div>
									</c:forEach>
								</div>
								<div class="row col-lg-12">
	     							<div class="panel-footer center"></div>
	          					</div>
							</div>
						</div>
					</div>
					<!-- End administrator-user -->
					
					<!-- administrator-Userdelivery -->
						<div id="administrator-Userdelivery" class="administrator">
							<ul class="nav nav-pills sort-source" data-sort-id="portfolio" data-option-key="filter" data-plugin-options="{'layoutMode': 'masonry', 'filter': '*'}">
								<li class="nav-item" data-option-value=".depositCompleted"><a class="nav-link" href="#">입금완료</a></li>
								<li class="nav-item" data-option-value=".depositWaiting"><a class="nav-link" href="#">입금대기</a></li>
							</ul>
							<div class="sort-destination-loader sort-destination-loader-showing mt-4 pt-2">
								<div class="row portfolio-list sort-destination" data-sort-id="portfolio">

								<!-- 여기에 컨텐츠 삽입 -->

								</div>
								<div class="row col-lg-12">
	     							<div class="panel-footer center"></div>
	          					</div>
							</div>
						</div>
					<!-- End administrator-user -->
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="openUserInfo" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog undefined">
        <div class="modal-content">
            <div class="modal-body post-content">
                <%@ include file="includes/content/register/readUserInfo.jsp"%>
            </div>
        </div>
    </div>
</div>

  <!-- Vendor -->
   <script src="/warm/resources/VertexEx/vendor/jquery/jquery.js"></script>
   <script src="/warm/resources/VertexEx/vendor/jquery/jquery.nav.js"></script>
   <script src="/warm/resources/VertexEx/vendor/jquery/jquery.validate.js"></script>
   <script src="/warm/resources/VertexEx/vendor/jquery.appear/jquery.appear.min.js"></script>
   <script src="/warm/resources/VertexEx/vendor/jquery.easing/jquery.easing.min.js"></script>
   <script src="/warm/resources/VertexEx/vendor/jquery-cookie/jquery-cookie.min.js"></script>
   <script src="/warm/resources/VertexEx/vendor/magnific-popup/jquery.magnific-popup.js"></script>
   <script src="/warm/resources/VertexEx/vendor/modernizr/modernizr.min.js"></script>
   <script src="/warm/resources/VertexEx/vendor/tether/tether.min.js"></script>
   <script src="/warm/resources/VertexEx/vendor/bootstrap/js/bootstrap.min.js"></script>
   <script src="/warm/resources/VertexEx/vendor/menuzord/menuzord.js"></script>
   <script src="/warm/resources/VertexEx/vendor/sticky/jquery.sticky.min.js"></script>
   <script src="/warm/resources/VertexEx/vendor/isotope/jquery.isotope.min.js"></script>
   <script src="/warm/resources/VertexEx/vendor/respond/respond.js"></script>
   <script src="/warm/resources/VertexEx/vendor/images-loaded/imagesloaded.js"></script>
   <script src="/warm/resources/VertexEx/vendor/owl-carousel/owl.carousel.js"></script>
   <script src="/warm/resources/VertexEx/vendor/wow/wow.min.js"></script>
   <script src="/warm/resources/VertexEx/vendor/lite-tooltip/js/litetooltip.js"></script>
   <script src="/warm/resources/VertexEx/js/theme-plugins.js"></script>
   <script src="/warm/resources/VertexEx/vendor/fitvids/fitvids.js"></script>

   <!-- Theme Initialization -->
   <script src="/warm/resources/VertexEx/js/theme.js"></script>
   <script src="/warm/resources/Vertex/js/theme.js"></script>

   <!-- Custom JS -->
   <script src="/warm/resources/VertexEx/js/custom.js"></script>
<script>
var userInfoDivID="";
var userInfoDiv="";
var userID="";
var userName="";
var userAuthLevel="";
$(document).on("click","select",function(){
	userInfoDivID=$(this).closest("div").attr("id");
	userID=$(this).closest("div").attr("data-userid");
	userAuthLevel=$(this).closest("div").attr("data-userauth");
	userName=$(this).closest("div").attr("data-username");
	userInfoDiv=$("#"+userInfoDivID);
});
function modifyUserAuthentication(auth){
	authentication={user_id:userID,authority:auth};
	adminService.modfiyAuthentication(authentication,function(result){
		userInfoInnerHTML="";
		userInfoInnerHTML+="<p class=\"v_blog-item-author\"><span>user_name :"+ userID +"</span></p>";
		userInfoInnerHTML+="<p class=\"v_blog-item-author\"><span>";
		userInfoInnerHTML+="<select onchange=\"javascript:modifyUserAuthentication(this.options[this.selectedIndex].value)\" name=\"authentication\">";
		userInfoInnerHTML+="<option value=\"\">수정된 권한 : "+auth.substring(5)+"</option>";
		userInfoInnerHTML+="<option value=\"ROLE_ADMIN\">관리자(LV3)</option>";
		userInfoInnerHTML+="<option value=\"ROLE_MANAGER\">매니저(LV2)</option>";
		userInfoInnerHTML+="<option value=\"ROLE_USER\">사용자(LV1)</option>";
		userInfoInnerHTML+="</select>";
		userInfoInnerHTML+="</span></p>";
		
		userInfoDiv.html(userInfoInnerHTML);
		alert(result);
		});
	}
$(document).ready(function() {
	// 페이징 처리
	var reviewPageNum=1;
	var reviewPagingFooter = $(".reviewPaging");
	var delReviewPostsCnt=${numberOfPostsOnReviewBoard};
	pagingService.paging(reviewPageNum,delReviewPostsCnt,reviewPagingFooter);
	var reviewBoardTable = $("#delReviewTable");
	showReviewBoard(-1);
	
	function showReviewBoard(page){
		adminService.getReviewListWithPaging(page,function(list){
			if(page==-1){
				reviewPageNum=Math.ceil(delReviewPostsCnt/10.0);
				showReviewBoard(reviewPageNum);
				return;
			}
			let BoardViewHTML="";
			if(list ==null||list.length==0){
				return;
			}
			
			BoardViewHTML+="<tr><th style=\"width:80px;\">번호</th><th style=\"width:420px;\">제목</th><th style=\"width:120px;\">작성자</th><th style=\"width:120px;\">날짜</th><th style=\"width:80px;\">공개여부</th></tr>";
			for(var i=0, len=list.length||0;i<len;i++){
				BoardViewHTML+="<tr><td>"+list[i].board_no+"</td><td style=\"overflow:hidden; text-overflow:ellipsis;\">";
				BoardViewHTML+="<div><div class=\"accordion v4\" id=\"accordion"+list[i].admin_bno+"\" role=\"tablist\" aria-multiselectable=\"true\">";
				BoardViewHTML+="<div class=\" transparent\"><div role=\"tab\" id=\"headingOne"+list[i].admin_bno+"\"><h5 class=\"mb-0\">";
				BoardViewHTML+="<a data-toggle=\"collapse\" data-parent=\"#accordion"+list[i].admin_bno+"\" href=\"#collapseOne"+list[i].admin_bno+"\" aria-expanded=\"false\" aria-controls=\"collapseOne"+list[i].admin_bno+"\" class=\"collapsed\">";
				for(let i=0; i<list[i].board_indent;i++){ // 보드 인덴트 수정하기
					BoardViewHTML+="[re]";
				}
				BoardViewHTML+=""+list[i].board_title+"";
				BoardViewHTML+="</h5></div><div id=\"collapseOne"+list[i].admin_bno+"\" class=\"collapse\" role=\"tabpanel\" aria-labelledby=\"headingOne"+list[i].admin_bno+"\" aria-expanded=\"false\" style=\"\">";
				BoardViewHTML+="<div class=\"card-block\"><p>"+list[i].board_content+"</p></div></div></div></div></div></td>";
				BoardViewHTML+="<td>"+list[i].user_id+"</td>";
				BoardViewHTML+="<td>"+displayTimeService.displayTime(list[i].board_written_time)+"</td>";
				BoardViewHTML+="<td>"+list[i].board_open+"</td></tr>";
			}
			reviewBoardTable.html(BoardViewHTML);
			pagingService.paging(page,delReviewPostsCnt,reviewPagingFooter);			
		});
	} // end showReviewBoard
	
	// click new comment page, get new comment
	reviewPagingFooter.on("click","li a",function(e){
		e.preventDefault();
		console.log("page click");
		let targetPageNum=$(this).attr("href");
		console.log("targetPageNum: "+targetPageNum);
		reviewPageNum=targetPageNum;
		showReviewBoard(reviewPageNum);
	});

	var commPageNum=1;
	var communityPagingFooter=$(".communityPaging");
	var delCommunityPostsCnt=${numberOfPostsOnCommunityBoard};
	pagingService.paging(commPageNum,delCommunityPostsCnt,communityPagingFooter);
	var communityBoardTable=$("#delCommTable");
	showCommBoard(-1);
	
	function showCommBoard(page){
		adminService.getCommListWithPaging(page,function(list){
			if(page==-1){
				commPageNum=Math.ceil(delCommunityPostsCnt/10.0);
				showCommBoard(commPageNum);
				return;
			}
			let BoardViewHTML="";
			if(list ==null||list.length==0){
				return;
			}
			
			BoardViewHTML+="<tr><th style=\"width:80px;\">번호</th><th style=\"width:420px;\">제목</th><th style=\"width:120px;\">작성자</th><th style=\"width:120px;\">날짜</th><th style=\"width:80px;\"><i class=\"fa fa-heart\"></i></th></tr>";
			for(var i=0, len=list.length||0;i<len;i++){
				BoardViewHTML+="<tr><td>"+list[i].board_no+"</td><td>";
				BoardViewHTML+="";
				BoardViewHTML+="<div><div class=\"accordion v4\" id=\"accordion"+list[i].admin_bno+"\" role=\"tablist\" aria-multiselectable=\"true\">";
				BoardViewHTML+="<div class=\" transparent\"><div role=\"tab\" id=\"headingOne"+list[i].admin_bno+"\"><h5 class=\"mb-0\">";
				BoardViewHTML+="<a data-toggle=\"collapse\" data-parent=\"#accordion"+list[i].admin_bno+"\" href=\"#collapseOne"+list[i].admin_bno+"\" aria-expanded=\"false\" aria-controls=\"collapseOne"+list[i].admin_bno+"\" class=\"collapsed\">";
				for(let i=0; i<list[i].board_indent;i++){ // 보드 인덴트 수정하기
					BoardViewHTML+="[re]";
				}
				BoardViewHTML+=""+list[i].board_subject+"&nbsp;"+list[i].board_title+"";
				BoardViewHTML+="</h5></div><div id=\"collapseOne"+list[i].admin_bno+"\" class=\"collapse\" role=\"tabpanel\" aria-labelledby=\"headingOne"+list[i].admin_bno+"\" aria-expanded=\"false\" style=\"\">";
				BoardViewHTML+="<div class=\"card-block\"><p>"+list[i].board_content+"</p></div></div></div></div></div></td>";
				BoardViewHTML+="<td>"+list[i].user_id+"</td>";
				BoardViewHTML+="<td>"+displayTimeService.displayTime(list[i].board_written_time)+"</td>";
				BoardViewHTML+="<td>"+list[i].board_clicked+"</td></tr>";
			}
			communityBoardTable.html(BoardViewHTML);
			pagingService.paging(page,delCommunityPostsCnt,communityPagingFooter);			
		});
	} // end showCommBoard
	

	// click new comment page, get new comment
	communityPagingFooter.on("click","li a",function(e){
		e.preventDefault();
		console.log("page click");
		let targetPageNum=$(this).attr("href");
		console.log("targetPageNum: "+targetPageNum);
		commPageNum=targetPageNum;
		showReviewBoard(commPageNum);
	});
	
});
</script>

<script type="text/javascript">
					$(document).ready(function(){
							$(".administrator").hide();
							$("#administrator-user").show();
							
							$("button").on("click",function(){
								let btnId=$(this).attr("data-Action");
							$(".administrator").hide();
							$("#"+btnId).show();
							});
					});
					
					$("#searchUserBtn").on("click",function(){
						alert();
						let searchID=$("#searchUser").val();
						  
						// ajax로 회원 아이디 검사해서 있으면 모달로 띄워주고, 없으면 없다고 띄워주기
						adminService.getUser(searchID,function(result){
							$("#user_name").val(result.user_name);
							let user_mail1=result.user_mail.split('@')[0];
							$("#user_mail1").val(user_mail1);
							let user_mail2=result.user_mail.split('@')[1];
							$("#user_mail2").val(user_mail2);
							$("#user_id").val(result.user_id);
							//비밀번호는 어떻게할래? user_pw  user_pw
							$("#user_nickname").val(result.user_nickname);
							let userbday=displayTimeService.displayTime(result.user_bday);
							userbday=userbday.split('-');
							$("#year").val(userbday[0]);
							$("#month").val(userbday[1]);
							$("#day").val((userbday[2].substring(0,2)));
							let phoneNum=result.user_phone.split('-');
							$("#user_phone1").val(phoneNum[0]);
							$("#user_phone2").val(phoneNum[1]);
							$("#user_phone3").val(phoneNum[2]);
							let user_sex='';
							if(result.user_sex=='m'){
								user_sex='여자';
							}else{user_sex='남자';}
							$("#user_sex").val(user_sex);
							$("#sample4_postcode").val(result.user_zipcode);
							$("#sample4_roadAddress").val(result.user_addr);
							$("#sample4_detailAddress").val(result.user_addr_detail);
						});
						e.preventdefault();  
					});
					
	$(".administrator-BoardBtn").on("click",function(){
		$(".community").show();
		$(".review").hide();
	});
	$("#reviewLi").on("click",function(){
		$(".community").show();
		$(".review").show();
	});
</script>
<section>
<%@ include file="includes/footer/footer-1.jsp"%>
</section>
</body>
</html>