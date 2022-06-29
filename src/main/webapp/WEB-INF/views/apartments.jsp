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
			<h1>Apartments</h1>
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
								<th>아파트 코드</th>
								<th>아파트 명</th>
								<th>도로명 주소</th>
								<th>구</th>
								<th>아파트 가격</th>
								<th>건축년도</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>대주파크빌</td>
								<td>대전 충정로 136</td>
								<td>동구</td>
								<td>34,500</td>
								<td>2022-06-27</td>
							</tr>
							<tr class="active-row">
								<td>1</td>
								<td>대주파크빌</td>
								<td>대전 충정로 136</td>
								<td>동구</td>
								<td>34,500</td>
								<td>2022-06-27</td>
							</tr>
							<tr>
								<td>1</td>
								<td>대주파크빌</td>
								<td>대전 충정로 136</td>
								<td>동구</td>
								<td>34,500</td>
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
						<div class="title">아파트 정보</div>
						<div class="form">
							<div class="inputfield">
								<label>아파트 이름 :</label> <input type="text" class="input" />
							</div>
							<div class="inputfield">
								<label>도로명 주소 :</label> <input type="text" class="input" />
							</div>
							<div class="inputfield">
								<label>최근 매매 가격 :</label> <input type="password" class="input" />
							</div>
							<div class="inputfield">
								<label>난방방식 :</label> <input type="password" class="input" />
							</div>
							<div class="inputfield">
								<label>건축 년도 :</label> <input type="password" class="input" />
							</div>
							<div class="inputfield">
								<label>동 수 :</label> <input type="text" class="input" />
							</div>
							<div class="inputfield">
								<label>세대 수 :</label> <input type="text" class="input" />
							</div>
							<div class="inputfield">
								<label>관리방식 :</label> <input type="text" class="input" />
							</div>
							<div class="inputfield">
								<label>주거전용면적 :</label> <input type="text" class="input" />
							</div>
							<div class="inputfield">
								<label>홈페이지주소 :</label> <input type="text" class="input" />
							</div>
							<div class="inputfield">
								<div id="map"
									style="width: 100%; height: 230px; background-color: tomato">
									카카오맵 위치</div>
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