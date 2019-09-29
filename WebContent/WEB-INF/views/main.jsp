<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html lang="en">
<!-- Start Head -->
   <head>
      <title>SAFE FOOD</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
      <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
   </head>
<!-- End Head -->

<body class="is-preload">

   <div id="wrapper">

<jsp:include page="./share/header.jsp"/>

<!-- 여기서부터  -->



   

<!--
START MODULE AREA 1: Impact Strip 3
-->
<div id="main">
                  <div class="inner">
                     <div class="searchBar">
                        <header>
                           <h1>What We Provide</h1>
                           <p>건강한 삶을 위한 먹거리 프로젝트</p>
                        </header>
                        <form  action="./search.do" action="post" >
                        <div class="row aln-center gtr-uniform">
                           <div class="col-3 col-12-small">
                              <select name="s_category" id="s_category">
                              <c:if test="${s_category eq 'name'}">
                                 <option value="name" selected="selected">상품명</option>
                              </c:if>
                              <c:if test="${s_category ne 'name'}">
                                 <option value="name" >상품명</option>
                              </c:if>
                              <c:if test="${s_category eq 'maker'}">
                                 <option value="maker" selected="selected">제조사</option>
                              </c:if>
                              <c:if test="${s_category ne 'maker'}">
                                 <option value="maker">제조사</option>
                              </c:if>
                              </select>
                           </div>
                           <div class="col-3 col-12-small">                     
                              <input type="text" name="s_keyword" id="s_keyword" placeholder="검색단어" value="${s_keyword}">
                           </div>
                           <div class="col-3 col-12-small">                     
                              <input type="submit" class="startSearch" value="검색" />
                           </div>
                        </div>
                        </form>
                     </div>
                  </div>
               </div>

<div id="mainPage">
                  <div class="inner">   
                  
                     <section class="tiles">
   <c:forEach items="${foodinfos}" var="foodinfo" varStatus="vs">
                           <article class="style1">
                              <span class = "image">
                                 <img src="${foodinfo.food_img}" alt="${foodinfo.food_code}" />
                              </span>
                              <a href='fooddetail.do?food_code=${foodinfo.food_code}'>
                                 <div class="content">
                                    <h2>${foodinfo.food_name}</h2>
                                 </div>
                              </a>
                           </article>
                        </c:forEach>
                     </section>
                  </div>
               </div>

<!-- 여기까지!!! -->

<jsp:include page="./share/footer.jsp"/>

</div>
</body>

</html>
         