<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<link href="/resources/css/shopstyle.css" rel="stylesheet">

<script>

</script>
</head>
 
<body> 
<header>
	<nav>
	<!-- 상세 카테고리-->
	<div class="category-container">
		<ul>
			<li><a href="/shop/product?shopTabCode=${shopTabCode}">ALL</a></li>
			<c:forEach var="detailTab" items="${detailList}">
				<li><a href="/shop/product?shopTabCode=${shopTabCode}&shopDetailTabCode=${detailTab.shopDetailTabCode}">${detailTab.shopDetailTabName}</a></li>
			</c:forEach>
		</ul>
		 
		<div class="category-container-second">
			<ul>
				<div class="dropdown">
					<button class="dropbtn">OPTION</button>
					<div class="dropdown-content">
						<a href="/shop/product?shopTabCode=${shopTabCode}&orderBy=regDate_desc">NEW</a>
						<a href="/shop/product?shopTabCode=${shopTabCode}&orderBy=productPrice_desc">Price(High)</a>
						<a href="/shop/product?shopTabCode=${shopTabCode}&orderBy=productPrice_asc">Price(Low)</a>
					</div>
				</div>
				<div class="dropdown">
					<button class="dropbtn">BRAND</button>
					<div class="dropdown-content">
					<c:forEach var="brandName" items="${brandList}">
						<a href="/shop/product?shopTabCode=${shopTabCode}&productBrandName=${brandName}">${brandName}</a>
					</c:forEach>
					</div>
				</div>   
			</ul>
		</div>
	</div>
	</nav>
</header>
	<!-- 모든 네비 아래 제품 보여주는 단 -->	
<section>
	<div class="container-xxl py-5">
		<div class="container">
			 <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
			 
				<c:if test="${shopTabCode eq 'A'}">
				      <h4 class="category-title">FURNITURE</h4>
				      <h1 class="big-title">가구</h1>
				</c:if>
				<c:if test="${shopTabCode eq 'B'}">
				      <h4 class="category-title">ELECTRONICES</h4>
				      <h1 class="big-title">가전</h1>
				</c:if>
				<c:if test="${shopTabCode eq 'C'}">
				      <h4 class="category-title">STUFF</h4>
				      <h1 class="big-title">잡화</h1>
				</c:if>
				<c:forEach var="detailTab" items="${detailList}">
					<c:if test="${shopDetailTabCode eq detailTab.shopDetailTabCode}">
				         <h1 class="small-title">${detailTab.shopDetailTabName}</h1>
					</c:if>
				</c:forEach>
		   </div>
		   
		   
		   	<!-- 제품 이미지 뿌려주는 단 -->
		        <div class="row g-0 team-items">
				   <c:forEach var="shop" items="${list}">
					    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
					        <div class="team-item position-relative">
					            <div class="position-relative">
					                <a href="/shop/productDetail?productIdk=${shop.productIdk}">
					                    <img class="img-fluid" src="/resources/images/product/small/${shop.productCode}.${shop.productFileExt}" alt="${shop.productName}"
					                        onmouseover="this.src='/resources/images/product/big/${shop.productCode}.${shop.productFileExt}'"
					                        onmouseout="this.src='/resources/images/product/small/${shop.productCode}.${shop.productFileExt}'">
					                </a>
					            </div>
					           <div class="bg-light text-center p-4">
								    <h3 class="mt-2">${shop.productName}</h3>
								    <span class="text-primary">${shop.productBrandName}</span><br/>
								
								</div>
					        </div>
					    </div>
					</c:forEach>
				</div>
		</div>
	</div>
</section>
</body>
</html>