<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- param:
  trainerId, name, hatiCode, gender, region, price, liked(0/1), imageUrl, bio(소개글 optional)
--%>

<div class="trainer-row">
  <!-- ✅ 왼쪽(이미지) -->
  <div class="trainer-row__left">
    <div class="trainer-row__avatarWrap">
      
      

      <!-- ✅ 아바타 -->
      <div class="trainer-row__avatar">
        <c:choose>
          <c:when test="${not empty param.imageUrl}">
            <img src="${param.imageUrl}" alt="${fn:escapeXml(param.name)}" class="trainer-row__avatarImg" />
          </c:when>
          <c:otherwise>
            <div class="trainer-row__avatarPh" aria-hidden="true">👤</div>
          </c:otherwise>
        </c:choose>
      </div>
    </div>

    <!-- ✅ HATI: 이미지(아바타) 밑 -->
    <c:if test="${not empty param.hatiCode}">
      <div class="trainer-row__hatiUnder">
        <span class="hati-pill">${fn:escapeXml(param.hatiCode)}</span>
      </div>
    </c:if>
  </div>

  <!-- ✅ 가운데(텍스트) -->
  <div class="trainer-row__main">
    <div class="trainer-row__top">
      <div class="trainer-row__title">
        <span class="trainer-row__name">${fn:escapeXml(param.name)} 트레이너</span>

        <!-- ✅ 성별: 이름 옆 -->
        <c:if test="${not empty param.gender}">
          <span class="gender-pill gender-pill--inline">${fn:escapeXml(param.gender)}</span>
        </c:if>
      </div>

      
    </div>

    <c:if test="${not empty param.bio}">
      <div class="trainer-row__bio">${fn:escapeXml(param.bio)}</div>
    </c:if>
  </div>

  <!-- ✅ 오른쪽(지역/가격/찜) -->
<div class="trainer-row__right">

  <!-- ✅ 오른쪽 상단: 지역 -->
  <div class="trainer-row__regionBadge">
	  <svg viewBox="0 0 24 24" class="trainer-row__pinSvg" aria-hidden="true">
      <path d="M12 21s-6-5.2-6-10a6 6 0 1 1 12 0c0 4.8-6 10-6 10Z"/>
      <path d="M12 13.0a2.2 2.2 0 1 0 0-4.4a2.2 2.2 0 0 0 0 4.4Z"/>
    </svg>
    <span class="trainer-row__regionText">${fn:escapeXml(param.region)}</span>
  </div>

  <!-- ✅ 오른쪽 하단: 가격 + 찜 -->
  <div class="trainer-row__rightBottom">

	<div class="trainer-row__actionLine">
    <!-- ✅ 가격(여기로 이동) -->
    <div class="trainer-row__price">
      <span class="trainer-row__priceIcon">₩</span>
      <span class="trainer-row__priceText">${fn:escapeXml(param.price)}</span>
      <span class="trainer-row__priceUnit">/회</span>
    </div>

    <!-- ✅ 찜 버튼(원래 있던 거 유지) -->
    <button type="button"
      class="trainer-row__fav ${param.liked == '1' ? 'is-active' : ''}"
      data-trainer-id="${fn:escapeXml(param.trainerId)}"
      aria-pressed="${param.liked == '1' ? 'true' : 'false'}">
      <span class="trainer-row__favIcon">♡</span>
      <span class="trainer-row__favText">찜</span>
    </button>
	</div>
  </div>
</div>

</div>