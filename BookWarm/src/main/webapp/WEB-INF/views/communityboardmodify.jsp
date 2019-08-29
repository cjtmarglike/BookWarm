﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/header/header-transparent-record.jsp"%>



<div class="page has-sidebar has-right-sidebar bordered">

	<div class="page-inner">

		<div class="container">
			<div class="row">
				<div class="col-md-3 left-side-sidebar pt-70">
					<aside class="sidebar">
						<!-- side menu 삽입 -->
						<%@ include file="includes/record/record.jsp"%>
					</aside>
				</div>

				<div class="col-md-8 right-side-sidebar v_blog-medium pt-70">


					<div>
						<table width="500" cellpadding="0" cellspacing="0" border="1">
							<form action="communityBoardSaveModify" method="post">
								<input type="hidden" name="comm_no" value="${communityBoardOne.comm_no}">
								<tr>
									<td>번호</td>
									<td>${communityBoardOne.comm_no}</td>
								</tr>
								<tr>
									<td>조회수</td>
									<td>${communityBoardOne.comm_clicked}</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="text" name="user_id" value="${communityBoardOne.user_id}"></td>
								</tr>
								<tr>
									<td>제목</td>
									<td><input type="text" name="comm_title" value="${communityBoardOne.comm_title}"></td>
								</tr>
								<tr>
									<td>말머리</td>
									<td><input type="text" name="comm_subject" value="${communityBoard.comm_subject}"></td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea rows="10" name="comm_content">${communityBoardOne.comm_content}</textarea></td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" value="저장">&nbsp;&nbsp; 
										<a href="communityboard">List</a> &nbsp;&nbsp; 
										<a href="communityboarddelete?comm_no=${communityBoardOne.comm_no}">Delete</a>
								</tr>
							</form>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="includes/footer/footer-1.jsp"%>
