<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- param:
  name, hatiCode, region, price, imageUrl, liked(0/1), trainerId
--%>

<div class="trainer-card">
  <div class="trainer-card__inner">
    <div class="trainer-card__avatar">
      <c:choose>
        <c:when test="${not empty param.imageUrl}">
          <img class="trainer-card__img"
               src="${param.imageUrl}"
               alt="${fn:escapeXml(param.name)}" />
        </c:when>
        <c:otherwise>
          <div class="trainer-card__placeholder" aria-hidden="true">
            <span class="trainer-card__placeholder-icon">👤</span>
          </div>
        </c:otherwise>
      </c:choose>
    </div>

	<%-- ✅ 여기 추가: 오른쪽 상단 칩(지역) --%>
	<c:if test="${not empty param.region}">
	  <div class="trainer-card__region-top">
	    <span class="trainer-card__pin" aria-hidden="true">
	      <svg viewBox="0 0 24 24" class="trainer-card__pin-svg" focusable="false" aria-hidden="true">
	        <path d="M12 21s-6-5.2-6-10a6 6 0 1 1 12 0c0 4.8-6 10-6 10Z"></path>
	        <path d="M12 13.0a2.2 2.2 0 1 0 0-4.4a2.2 2.2 0 0 0 0 4.4Z"></path>
	      </svg>
	    </span>
	    <span class="trainer-card__region-text">${fn:escapeXml(param.region)}</span>
	  </div>
	</c:if>
	
	
      <%-- ✅ 아바타와 이름 사이: HATI + 성별 --%>
    <div class="trainer-card__chips">
      <c:if test="${not empty param.hatiCode}">
        <span class="hati-pill">${fn:escapeXml(param.hatiCode)}</span>
      </c:if>

      <c:if test="${not empty param.gender}">
        <span class="gender-pill">${fn:escapeXml(param.gender)}</span>
      </c:if>
    </div>
	    
    <div class="trainer-card__body">
      <div class="trainer-card__name">${fn:escapeXml(param.name)} 트레이너</div>

      <div class="trainer-card__price">
        <span class="trainer-card__price-icon">₩</span>
        <span class="trainer-card__price-text">${fn:escapeXml(param.price)}원/회</span>
      </div>
    </div>
	
	<div class="card-actions">
  <button type="button"
          class="trainer-card__fav-btn fav-btn ${param.liked == '1' ? 'is-active' : ''}"
          data-trainer-id="${fn:escapeXml(param.trainerId)}"
          aria-pressed="${param.liked == '1' ? 'true' : 'false'}">
    <span class="fav-icon" aria-hidden="true"></span>
    <span class="fav-text">${param.liked == '1' ? '찜' : '찜하기'}</span>
  </button>

  <c:if test="${param.liked == '1'}">
    <button type="button" class="memo-btn" data-trainer-id="${fn:escapeXml(param.trainerId)}">
      메모
    </button>
  </c:if>
</div>
	
	
</div>
</div>
