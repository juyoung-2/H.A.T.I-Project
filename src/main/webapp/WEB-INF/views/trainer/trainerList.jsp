<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 
	  필요 Model 예시:
	  - trainers : List<TrainerVO> (검색 결과)
	  - popularTrainers : List<TrainerVO> (인기 트레이너)
	  - customizedTrainers : List<TrainerVO> (맞춤 트레이너)
	  - loginUser : (선택) 사용자 정보 (맞춤 추천에 필요)
	--%>
<c:set var="viewMode" value="${empty param.viewMode ? 'profile' : param.viewMode}" />
<c:set var="hasSearch" value="${not empty param.q}" />
<c:set var="hasFilter"
       value="${not empty param.priceSort
              or not empty paramValues.hmbti
              or not empty paramValues.district
              or not empty paramValues.gender}" />
<c:set var="showRecommend" value="${not hasSearch and not hasFilter}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value='/resources/css/trainer_list.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/trainerCard.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/trainerRow.css'/>" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="trainer-page">
  <div class="trainer-container">

    <div class="trainer-header">
      <h2 class="trainer-title">트레이너 찾기</h2>

      <form class="trainer-searchbar" method="get" action="<c:url value='/trainer'/>">

		<div class="searchbar-row">
		<!-- 검색창 박스(독립) -->
        <div class="search-input-wrap">
          <span class="search-icon" aria-hidden="true">🔍</span>
          
          <input
            class="search-input"
            type="text"
            name="q"
            value="${fn:escapeXml(param.q)}"
            placeholder="트레이너 검색..."
          />
        </div>
 		<!-- 필터 버튼(독립) -->
		<!-- 오른쪽  필터 아이콘 버튼: 클릭 시 모달 open -->
        <button class="filter-icon-btn" type="button" id="openFilterBtn" title="필터" aria-label="필터">
        </button>

		</div>
		<div class="viewmode-row">
		  <label class="vm-chip">
		    <input type="radio" name="viewMode" value="profile"
		           <c:if test="${viewMode eq 'profile'}">checked</c:if> />
		    <span>프로필 위주</span>
		  </label>
		
		  <label class="vm-chip">
		    <input type="radio" name="viewMode" value="info"
		           <c:if test="${viewMode eq 'info'}">checked</c:if> />
		    <span>정보 위주</span>
		  </label>
		</div>
	 </form>
	 
	 <!-- =========================
                                    필터 모달
     ========================= -->
	<div class="modal" id="filterModal" aria-hidden="true">
	  <div class="modal-overlay" id="filterOverlay"></div>
	
	  <div class="modal-panel" role="dialog" aria-modal="true" aria-labelledby="filterTitle" tabindex="-1">
	    
	    <!-- 헤더 -->
	    <div class="modal-header">
	      <h3 class="modal-title" id="filterTitle">필터</h3>
	      <button type="button" class="icon-btn" id="closeFilterBtn" aria-label="닫기">✕</button>
	    </div>
	
		<!-- 바디 -->
	    <div class="modal-body">
	    
	    <!-- ✅ 필터 전용 GET form -->
	    <form method="get" action="<c:url value='/trainer'/>">
	      <!-- 검색어 유지 -->
	      <input type="hidden" name="q" value="${fn:escapeXml(param.q)}" />
	
	      <!-- ✅ 여기로 "기존 filter-panel"을 그대로 붙여넣기 -->
	      <div class="filter-panel">
	        <!-- 아래 내용: 네가 준 filter-section들 그대로 -->
	        <%-- 정렬 (추천순/인기순) --%>
			<div class="filter-section">
			  <div class="filter-title">정렬</div>
			  <div class="filter-row filter-row--plain">
			  <div class="filter-row">
			    <label class="chip-radio">
			      <input type="radio" name="sort" value="recommend"
			             <c:if test="${empty param.sort or param.sort eq 'recommend'}">checked</c:if> />
			      <span>추천순</span>
			    </label>
			
			    <label class="chip-radio">
			      <input type="radio" name="sort" value="popular"
			             <c:if test="${param.sort eq 'popular'}">checked</c:if> />
			      <span>인기순</span>
			    </label>
			  	</div>
			  </div>
			</div>
	        
	
	        <%-- 금액 정렬 --%>
	        <div class="filter-section">
          <div class="filter-title">금액</div>
	          <div class="filter-row filter-row--plain">
		          <div class="filter-row">
		            <label class="chip-radio">
		              <input type="radio" name="priceSort" value="low"
		                     <c:if test="${param.priceSort eq 'low'}">checked</c:if> />
		              <span>저가순</span>
		            </label>
		            <label class="chip-radio">
		              <input type="radio" name="priceSort" value="high"
		                     <c:if test="${param.priceSort eq 'high'}">checked</c:if> />
		              <span>고가순</span>
		            </label>
	            	</div>
     	       </div>
	        </div>
	
	 	<%-- 성별 (단일 선택: 라디오) --%>
		<div class="filter-section">
		  <div class="filter-title">성별</div>
		
		  <div class="filter-row filter-row--plain">
		    <%-- 선택안함(전체) 옵션: 필요 없으면 이 라벨 줄 삭제 --%>
		    <label class="chip-radio">
		      <input type="radio" name="gender" value=""
		             <c:if test="${empty param.gender}">checked</c:if> />
		      <span>전체</span>
		    </label>
		
		    <label class="chip-radio">
		      <input type="radio" name="gender" value="남자"
		             <c:if test="${param.gender eq '남자'}">checked</c:if> />
		      <span>남자</span>
		    </label>
		
		    <label class="chip-radio">
		      <input type="radio" name="gender" value="여자"
		             <c:if test="${param.gender eq '여자'}">checked</c:if> />
		      <span>여자</span>
		    </label>
		  </div>
		</div>
	 		
	
	
			<%-- HMBTI (16 types) --%>
			<div class="filter-section">
			  <div class="filter-title">HMBTI</div>
			
			  <%-- 선택된 값 체크용(join) --%>
			  <c:set var="hmbtiJoined" value="${fn:join(paramValues.hmbti, ',')}" />
			
			  <%-- 많으니까 박스 스크롤 처리 --%>
			  <div class="filter-scroll rows-3 filter-scroll--hmbti">
			    <div class="filter-grid">
			      <c:forEach var="t"
			                 items="${fn:split('ICFL,ICFH,ICRL,ICRH,IPFL,IPFH,IPRL,IPRH,OCFL,OCFH,OCRL,OCRH,OPFL,OPFH,OPRL,OPRH', ',')}">
			        <label class="chip-check">
			          <input type="checkbox" name="hmbti" value="${t}"
			                 <c:if test="${fn:contains(hmbtiJoined, t)}">checked</c:if> />
			          <span class="hmbti-badge hmbti-${t}">${t}</span>
			        </label>
			      </c:forEach>
			    </div>
			  </div>
			</div>
	
	        
	
	        <%-- 지역 --%>
	        <div class="filter-section">
	          <div class="filter-title">지역(서울)</div>
	           <div class="filter-scroll rows-3 filter-scroll--district">
		          <div class="filter-grid">
		            <c:set var="districtJoined" value="${fn:join(paramValues.district, ',')}" />
		            <c:forEach var="d" items="${fn:split('강남구,강동구,강북구,강서구,관악구,광진구,구로구,금천구,노원구,도봉구,동대문구,동작구,마포구,서대문구,서초구,성동구,성북구,송파구,양천구,영등포구,용산구,은평구,종로구,중구,중랑구', ',')}">
		              <label class="chip-check">
		                <input type="checkbox" name="district" value="${d}"
		                       <c:if test="${fn:contains(districtJoined, d)}">checked</c:if> />
		                <span>${d}</span>
		              </label>
		            </c:forEach>
		          </div>
	           </div>
	        </div>
	
			<%-- 찜한 트레이너 --%>
			<div class="filter-section">
			  <div class="filter-title">찜한 트레이너</div>
			
			  <div class="filter-row filter-row--plain">
			    <label class="chip-radio">
			      <input type="checkbox" name="onlyBookmarked" value="1"
			             <c:if test="${param.onlyBookmarked eq '1'}">checked</c:if> />
			      <span>찜한 트레이너만 보기</span>
			    </label>
			  </div>
			</div>
			
			<%-- 추천순(찜 수) 기간 --%>
			<div class="filter-section">
			  <div class="filter-title">추천순 (찜 수)</div>
			
				  <div class="filter-row filter-row--plain">
				    <c:set var="bmPeriod" value="${empty param.bookmarkPeriod ? 'ALL' : param.bookmarkPeriod}" />
				
				    <label class="chip-radio">
				      <input type="radio" name="bookmarkPeriod" value="WEEK"
				             <c:if test="${bmPeriod eq 'WEEK'}">checked</c:if> />
				      <span>주간</span>
				    </label>
				
				    <label class="chip-radio">
				      <input type="radio" name="bookmarkPeriod" value="MONTH"
				             <c:if test="${bmPeriod eq 'MONTH'}">checked</c:if> />
				      <span>월간</span>
				    </label>
				
				    <label class="chip-radio">
				      <input type="radio" name="bookmarkPeriod" value="YEAR"
				             <c:if test="${bmPeriod eq 'YEAR'}">checked</c:if> />
				      <span>연간</span>
				    </label>
				
				    <label class="chip-radio">
				      <input type="radio" name="bookmarkPeriod" value="ALL"
				             <c:if test="${bmPeriod eq 'ALL'}">checked</c:if> />
				      <span>누적</span>
				    </label>
				  </div>
			  </div>
			  </div> <!-- filter-panel 끝 -->
			  <!-- ✅ 기존 filter-actions는 모달 footer로 옮길거라 여기서는 제거해도 됨 -->
		      <div class="modal-footer">
		        <a class="btn-outline" href="<c:url value='/trainer'/>">초기화</a>
		        <button type="submit" class="btn-primary">적용</button>
		      </div>
	  	    </form>
		 </div> <!-- modal-body 끝 -->
	      
	    </div> <!-- modal-panel 끝 -->
	  </div> <!-- modal 끝 -->


    <%-- =========================
         추천 섹션(검색/필터 없을 때)
         ========================= --%>
    <c:if test="${showRecommend}">
      <div class="section">
        <h3 class="section-title">인기 트레이너</h3>
		
        <div class="${viewMode eq 'profile' ? 'trainer-grid' : 'trainer-list'}">
         	 <jsp:include page="cardList.jsp">
			    <jsp:param name="listType" value="popular"/>
			    <jsp:param name="viewMode" value="${viewMode}"/>
			  </jsp:include>
        </div>
      </div>

      <div class="section">
        <h3 class="section-title">
          <c:out value="${loginUser.nickname != null ? loginUser.nickname : '사용자'}"/>님을 위한 맞춤 트레이너
        </h3>

        <div class="${viewMode eq 'profile' ? 'trainer-grid' : 'trainer-list'}">
         	<jsp:include page="cardList.jsp">
			    <jsp:param name="listType" value="customized"/>
			    <jsp:param name="viewMode" value="${viewMode}"/>
			 </jsp:include>
        </div>
      </div>
    </c:if>

</div>
    <%-- =========================
         검색 결과 섹션(검색/필터 있을 때)
         ========================= --%>
    <c:if test="${not showRecommend}">
      <div class="section">
        <h3 class="section-title">
          검색 결과 (<c:out value="${fn:length(trainers)}"/>명)
        </h3>

        <div class="${viewMode eq 'profile' ? 'trainer-grid' : 'trainer-list'}">
          <c:forEach var="tr" items="${trainers}">
            <c:choose>
              <c:when test="${viewMode eq 'profile'}">
                <div class="trainer-card">
                  <div class="avatar avatar-lg">👤</div>
                  <div class="trainer-name">${fn:escapeXml(tr.name)}</div>
                  <div class="badge-wrap">
                    <span class="hmbti-badge hmbti-${tr.hmbti}">${tr.hmbti}</span>
                  </div>
                  <div class="meta">
                    <span class="meta-item">📍 ${tr.location}</span>
                    <span class="meta-item">· ${tr.gender}</span>
                  </div>
                  <div class="price">💰 ${tr.price}원/회</div>
                  <div class="card-actions">
                    <button type="button" class="btn-outline">찜하기</button>
                  </div>
                </div>
              </c:when>
              <c:otherwise>
                <div class="trainer-row">
                  <div class="avatar avatar-sm">👤</div>
                  <div class="row-main">
                    <div class="row-top">
                      <div>
                        <div class="trainer-name-sm">${fn:escapeXml(tr.name)}</div>
                        <span class="hmbti-badge hmbti-${tr.hmbti}">${tr.hmbti}</span>
                      </div>
                      <div class="row-price">💰 ${tr.price}원</div>
                    </div>
                    <div class="row-bio">${fn:escapeXml(tr.bio)}</div>
                    <div class="row-bottom">
                      <span class="meta-item">📍 ${tr.location}</span>
                      <span class="meta-item">· ${tr.gender}</span>
                      <button type="button" class="btn-outline btn-sm">찜</button>
                    </div>
                  </div>
                </div>
              </c:otherwise>
            </c:choose>
          </c:forEach>

          <c:if test="${empty trainers}">
            <div class="empty-state">
              조건에 맞는 트레이너가 없습니다.
            </div>
          </c:if>
        </div>
      </div>
    </c:if>

  </div>
</div>
	
	
</body>
<script src="<c:url value='/resources/js/trainerFilter.js'/>"></script>
<script>
document.addEventListener('DOMContentLoaded', function(){
  var form = document.querySelector('.trainer-searchbar');
  if(!form) return;

  var radios = form.querySelectorAll('input[name="viewMode"]');
  for (var i = 0; i < radios.length; i++) {
    radios[i].addEventListener('change', function(){
      form.submit(); // ✅ 라디오 바꾸면 즉시 GET 요청
    });
  }
});
</script>

</html>