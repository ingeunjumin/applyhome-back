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
        <h1>Crawling data</h1>
        <div class="row">
          <div class="data-container">
					<table class="content-table">
						<thead>
							<tr>
								<th>아파트 코드</th>
								<th>아파트 명</th>
								<th>도로명 주소</th>
								<th>구</th>
								<th>매매 가격</th>
								<th>거래 날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(pageHelper.list) > 0}">
									<c:forEach items="${pageHelper.list}" var="item">
										<tr id="aptNumber${item.subscriptionNo}"
											onclick="getApartmentsWrapper(${item.subscriptionNo})">
											<td>${item.subscriptionNo}</td>
											<td>${item.apartmentsName}</td>
											<td>${item.apartmentsAddress}</td>
											<td>${item.ASapartmentsSubscriptionDate}</td>
										</tr>
									</c:forEach>
								</c:when>

								<c:otherwise>
									<tr>
										<td colspan="4">데이터가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							<!--<tr>
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
                </tr>  -->
						</tbody>
					</table>
					<div class="pagination">
            <!--
              <a href="#">Previous</a>
              <a href="#">1</a>
              <a href="#">2</a>
              <a href="#">3</a>
              <a href="#">4</a>
              <a href="#">5</a>
              <a href="#">Next</a>-->
            </div>
          </div>
          <!--data-container end-->
          <div class="detail-data-container">
            <div class="wrapper">
              <div class="title">위치 정보</div>
              <div class="form">
                <div class="inputfield">
                  <label>Hello World</label>
                
                </div>
              </div>
            </div>
          </div>
          <!--detail-data-container-->
        </div>
      </div>
    </main>
    <script defer src="/resources/static/js/theme.js"></script>
    <script>
     
    </script>
  </body>
</html>
