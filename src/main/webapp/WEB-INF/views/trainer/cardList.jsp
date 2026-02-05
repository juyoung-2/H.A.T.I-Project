<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- =========================================================
     cardList.jsp (include fragment)
     - 절대 HTML/head/body 넣지 말 것
     - 절대 section/title 넣지 말 것 (부모가 이미 출력함)
     - 여기서는 "카드들만" 출력한다
   ========================================================= --%>

<c:set var="vm" value="${empty param.viewMode ? 'profile' : param.viewMode}" />

<c:choose>
  <%-- 인기 트레이너 --%>
  <c:when test="${param.listType eq 'popular'}">

    <%-- 101 --%>
    <c:choose>
      <c:when test="${vm eq 'info'}">
        <jsp:include page="/WEB-INF/views/trainer/trainerRow.jsp">
          <jsp:param name="trainerId" value="101" />
          <jsp:param name="name" value="이영희" />
          <jsp:param name="hatiCode" value="HYOG" />
          <jsp:param name="gender" value="여" />
          <jsp:param name="region" value="서초구" />
          <jsp:param name="price" value="60,000" />
          <jsp:param name="liked" value="0" />
          <jsp:param name="imageUrl" value="" />
          <jsp:param name="bio" value="필라테스 전문 강사로 바른 자세 교정과 코어 강화에 특화되어 있습니다." />
        </jsp:include>
      </c:when>
      <c:otherwise>
        <jsp:include page="/WEB-INF/views/trainer/trainerCard.jsp">
          <jsp:param name="trainerId" value="101" />
          <jsp:param name="name" value="이영희" />
          <jsp:param name="hatiCode" value="HYOG" />
          <jsp:param name="gender" value="여" />
          <jsp:param name="region" value="서초구" />
          <jsp:param name="price" value="60,000" />
          <jsp:param name="liked" value="0" />
          <jsp:param name="imageUrl" value="" />
        </jsp:include>
      </c:otherwise>
    </c:choose>

    <%-- 102 --%>
    <c:choose>
      <c:when test="${vm eq 'info'}">
        <jsp:include page="/WEB-INF/views/trainer/trainerRow.jsp">
          <jsp:param name="trainerId" value="102" />
          <jsp:param name="name" value="최수진" />
          <jsp:param name="hatiCode" value="HSTR" />
          <jsp:param name="gender" value="여" />
          <jsp:param name="region" value="송파구" />
          <jsp:param name="price" value="70,000" />
          <jsp:param name="liked" value="0" />
          <jsp:param name="imageUrl" value="" />
          <jsp:param name="bio" value="재활 운동과 기능성 트레이닝 전문가입니다." />
        </jsp:include>
      </c:when>
      <c:otherwise>
        <jsp:include page="/WEB-INF/views/trainer/trainerCard.jsp">
          <jsp:param name="trainerId" value="102" />
          <jsp:param name="name" value="최수진" />
          <jsp:param name="hatiCode" value="HSTR" />
          <jsp:param name="gender" value="여" />
          <jsp:param name="region" value="송파구" />
          <jsp:param name="price" value="70,000" />
          <jsp:param name="liked" value="0" />
          <jsp:param name="imageUrl" value="" />
        </jsp:include>
      </c:otherwise>
    </c:choose>

    <%-- 103 --%>
    <c:choose>
      <c:when test="${vm eq 'info'}">
        <jsp:include page="/WEB-INF/views/trainer/trainerRow.jsp">
          <jsp:param name="trainerId" value="103" />
          <jsp:param name="name" value="박민수" />
          <jsp:param name="hatiCode" value="HCAL" />
          <jsp:param name="gender" value="남" />
          <jsp:param name="region" value="강남구" />
          <jsp:param name="price" value="45,000" />
          <jsp:param name="liked" value="1" />
          <jsp:param name="imageUrl" value="" />
          <jsp:param name="bio" value="다이어트와 체형 교정 전문. 맞춤형 식단 관리도 함께 제공합니다." />
        </jsp:include>
      </c:when>
      <c:otherwise>
        <jsp:include page="/WEB-INF/views/trainer/trainerCard.jsp">
          <jsp:param name="trainerId" value="103" />
          <jsp:param name="name" value="박민수" />
          <jsp:param name="hatiCode" value="HCAL" />
          <jsp:param name="gender" value="남" />
          <jsp:param name="region" value="강남구" />
          <jsp:param name="price" value="45,000" />
          <jsp:param name="liked" value="1" />
          <jsp:param name="imageUrl" value="" />
        </jsp:include>
      </c:otherwise>
    </c:choose>

  </c:when>

  <%-- 맞춤 트레이너 --%>
  <c:otherwise>

    <c:choose>
      <c:when test="${vm eq 'info'}">
        <jsp:include page="/WEB-INF/views/trainer/trainerRow.jsp">
          <jsp:param name="trainerId" value="201" />
          <jsp:param name="name" value="김철수" />
          <jsp:param name="hatiCode" value="HFIT" />
          <jsp:param name="gender" value="남" />
          <jsp:param name="region" value="강남구" />
          <jsp:param name="price" value="50,000" />
          <jsp:param name="liked" value="0" />
          <jsp:param name="imageUrl" value="" />
          <jsp:param name="bio" value="기초 체력부터 근비대까지 단계별로 맞춰드립니다." />
        </jsp:include>
      </c:when>
      <c:otherwise>
        <jsp:include page="/WEB-INF/views/trainer/trainerCard.jsp">
          <jsp:param name="trainerId" value="201" />
          <jsp:param name="name" value="김철수" />
          <jsp:param name="hatiCode" value="HFIT" />
          <jsp:param name="gender" value="남" />
          <jsp:param name="region" value="강남구" />
          <jsp:param name="price" value="50,000" />
          <jsp:param name="liked" value="0" />
          <jsp:param name="imageUrl" value="" />
        </jsp:include>
      </c:otherwise>
    </c:choose>

  </c:otherwise>
</c:choose>
