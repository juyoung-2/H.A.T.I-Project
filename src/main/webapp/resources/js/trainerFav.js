(function () {
  document.addEventListener("click", function (e) {
    var favBtn = e.target.closest ? e.target.closest(".trainer-card__fav-btn") : null;
    if (!favBtn) return;

    var card = favBtn.closest(".trainer-card");
    if (!card) return;

    var memoBtn = card.querySelector(".memo-btn");

    // ✅ UI 토글
    var isActive = favBtn.classList.toggle("is-active");
    favBtn.setAttribute("aria-pressed", isActive ? "true" : "false");

    if (memoBtn) {
      if (isActive) memoBtn.classList.remove("is-hidden");
      else memoBtn.classList.add("is-hidden");
    }

    // (선택) 텍스트 바꾸기
    var textEl = favBtn.querySelector(".fav-text");
    if (textEl) textEl.textContent = isActive ? "찜" : "찜하기";
  });
})();

(function () {
	  var modal = document.getElementById("trainerMemoModal");
	  if (!modal) return;

	  var titleNameEl = modal.querySelector(".memo-modal__trainer-name");
	  var textarea = document.getElementById("memoModalTextarea");
	  var saveBtn = document.getElementById("memoModalSaveBtn");

	  var currentTrainerId = null;

	  function openModal(trainerId, trainerName) {
	    currentTrainerId = trainerId || null;
	    
	    var cleanName = (trainerName || "").replace(/\s*트레이너\s*$/, "").trim();
	    if (titleNameEl) titleNameEl.textContent = (cleanName || "트레이너") + " 트레이너";
	    
	    if (textarea) textarea.value = ""; // (원하면 서버에서 기존 메모 로드 후 세팅)
	    modal.classList.add("is-open");
	    modal.setAttribute("aria-hidden", "false");
	    if (textarea) textarea.focus();
	  }

	  function closeModal() {
	    modal.classList.remove("is-open");
	    modal.setAttribute("aria-hidden", "true");
	    currentTrainerId = null;
	  }

	  // ✅ 열기: 메모 버튼 클릭
	  document.addEventListener("click", function (e) {
	    var memoBtn = e.target.closest ? e.target.closest(".memo-btn") : null;
	    if (memoBtn) {
	      var trainerId = memoBtn.getAttribute("data-trainer-id");

	      // 카드에서 트레이너 이름 가져오기(있으면)
	      var card = memoBtn.closest(".trainer-card");
	      var nameEl = card ? card.querySelector(".trainer-card__name") : null;
	      var trainerName = nameEl ? nameEl.textContent.replace(" 트레이너", "") : "트레이너";

	      openModal(trainerId, trainerName);
	      return;
	    }

	    // ✅ 닫기: X / 취소 / 백드롭
	    var closeTarget = e.target.closest ? e.target.closest("[data-memo-close='true']") : null;
	    if (closeTarget) {
	      closeModal();
	      return;
	    }
	  });

	  // ✅ ESC로 닫기
	  document.addEventListener("keydown", function (e) {
	    if (e.key === "Escape" && modal.classList.contains("is-open")) {
	      closeModal();
	    }
	  });

	  // ✅ 저장 버튼(여기서 API 연결)
	  if (saveBtn) {
	    saveBtn.addEventListener("click", function () {
	      var memoText = textarea ? textarea.value : "";
	      if (!currentTrainerId) {
	        closeModal();
	        return;
	      }

	      // TODO: 서버 저장 API 호출
	      // 예) fetch('/trainer/memo/save', { method:'POST', ... })

	      console.log("save memo", { trainerId: currentTrainerId, memo: memoText });

	      closeModal();
	    });
	  }
	})();
