<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="trainer-row">

  <!-- ================= 왼쪽 : 이미지 ================= -->
  <div class="trainer-row__left">
    <div class="trainer-row__avatarWrap">
      <div class="trainer-row__avatar">
        <c:choose>
          <c:when test="${not empty param.imageUrl}">
            <img src="${param.imageUrl}"
                 alt="${fn:escapeXml(param.name)}"
                 class="trainer-row__avatarImg" />
          </c:when>
          <c:otherwise>
            <div class="trainer-row__avatarPh" aria-hidden="true">👤</div>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>

  <!-- ================= 가운데 : 메인 ================= -->
  <div class="trainer-row__main">

    <!-- 🔥 한 줄 핵심 라인 -->
    <div class="trainer-row__top">

      <!-- ⬅️ 왼쪽 묶음 -->
      <div class="trainer-row__topLine">

        <!-- 이름 -->
        <span class="trainer-row__name">
          ${fn:escapeXml(param.name)} 트레이너
        </span>


        <!-- 성별 -->
        <c:if test="${not empty param.gender}">
          <span class="gender-pill">
            ${fn:escapeXml(param.gender)}
          </span>
        </c:if>


        <!-- HATI -->
        <c:if test="${not empty param.hatiCode}">
          <span class="hati-pill">
            ${fn:escapeXml(param.hatiCode)}
          </span>
        </c:if>


        <!-- 지역 -->
        <c:if test="${not empty param.region}">
          <span class="trainer-row__regionInline">
            <svg viewBox="0 0 24 24"
                 class="trainer-row__pinSvg"
                 aria-hidden="true">
              <path d="M12 21s-6-5.2-6-10a6 6 0 1 1 12 0c0 4.8-6 10-6 10Z"/>
              <path d="M12 13a2.2 2.2 0 1 0 0-4.4a2.2 2.2 0 0 0 0 4.4Z"/>
            </svg>
            <span class="trainer-row__regionText">
              ${fn:escapeXml(param.region)}
            </span>
          </span>
        </c:if>

      </div>

      <!-- ➡️ 오른쪽 : 가격 -->
      <div class="trainer-row__price">
        <span class="trainer-row__priceIcon">₩</span>
        <span class="trainer-row__priceText">
          ${fn:escapeXml(param.price)}
        </span>
        <span class="trainer-row__priceUnit">/회</span>
      </div>

    </div>

    <!-- 소개글 -->
    <c:if test="${not empty param.bio}">
      <div class="trainer-row__bio">
        ${fn:escapeXml(param.bio)}
      </div>
    </c:if>

  </div>

  <!-- ================= 오른쪽 : 찜 ================= -->
  <div class="trainer-row__right">
    <button type="button"
      class="trainer-row__fav ${param.liked == '1' ? 'is-active' : ''}"
      data-trainer-id="${fn:escapeXml(param.trainerId)}">
      <span class="trainer-row__favIcon">♡</span>
      <span class="trainer-row__favText">찜</span>
    </button>
  </div>

</div>
