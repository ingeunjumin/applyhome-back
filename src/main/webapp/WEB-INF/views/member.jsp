<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="include/header.jsp"></jsp:include>

<body>

	<jsp:include page="include/nav.jsp"></jsp:include>
	
	<main>
		<div class="container">
			<h1>Members</h1>
			<!-- search -->
			<div class="search">
				<label> <input id="searchBar" type="text"
					placeholder="검색어 입력..." />
				</label>
			</div>
			<div class="row">
				<div class="data-container">
					<table class="content-table">
						<thead>
							<tr>
								<th>No</th>
								<th>Name</th>
								<th>ID</th>
								<th>Auth</th>
								<th>Join at</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>현상원</td>
								<td>apple1</td>
								<td>ROOT</td>
								<td>2022-06-27</td>
							</tr>
							<tr class="active-row">
								<td>2</td>
								<td>현상원</td>
								<td>apple1</td>
								<td>ADMIN</td>
								<td>2022-06-27</td>
							</tr>
							<tr>
								<td>3</td>
								<td>현상원</td>
								<td>apple1</td>
								<td>USER</td>
								<td>2022-06-27</td>
							</tr>
						</tbody>
					</table>
					<div class="pagination">
						<a href="#">Previous</a> <a href="#">1</a> <a href="#">2</a> <a
							href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">Next</a>
					</div>
				</div>
				<!--data-container end-->
				<div class="detail-data-container">
					<div class="wrapper">
						<div class="title">사용자 정보</div>
						<div class="form">
							<div class="inputfield">
								<label>Name :</label> <input type="text" class="input" />
							</div>
							<div class="inputfield">
								<label>ID :</label> <input type="text" class="input" />
							</div>
							<div class="inputfield">
								<label>Password</label> <input type="password" class="input" />
							</div>
							<div class="inputfield">
								<label>Confirm Password</label> <input type="password"
									class="input" />
							</div>
							<div class="inputfield">
								<label>Authority</label>
								<div class="custom_select">
									<select>
										<option value="null">SELECT</option>
										<option value="root">ROOT</option>
										<option value="admin">ADMIN</option>
										<option value="admin">USER</option>
									</select>
								</div>
							</div>
							<div class="inputfield">
								<label>Email Address</label> <input type="text" class="input" />
							</div>
							<div class="inputfield">
								<label>Phone Number</label> <input type="text" class="input" />
							</div>
							<div class="inputfield">
								<label>Address</label>
								<textarea class="textarea"></textarea>
							</div>
							<div class="inputfield">
								<label>Postal Code</label> <input type="text" class="input" />
							</div>
							<div class="inputfield terms">
								<label class="check"> <input type="checkbox" /> <span
									class="checkmark"></span>
								</label>
								<p>Agreed to terms and conditions</p>
							</div>
							<div class="inputfield">
								<input type="submit" value="수정하기" class="btn" />
							</div>
						</div>
					</div>
				</div>
				<!--detail-data-container-->
			</div>
		</div>
	</main>
	<script defer src="/resources/static/js/theme.js"></script>
</body>
</html>
