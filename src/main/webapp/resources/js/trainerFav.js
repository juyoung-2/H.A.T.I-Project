(function () {
  document.addEventListener("click", function (e) {
    var favBtn = e.target.closest ? e.target.closest(".trainer-card__fav-btn") : null;
    if (!favBtn) return;

    var card = favBtn.closest(".trainer-card");
    if (!card) return;

    var memoBtn = card.querySelector(".trainer-card__memo-btn");

    // ✅ UI 토글
    var isActive = favBtn.classList.toggle("is-active");
    favBtn.setAttribute("aria-pressed", isActive ? "true" : "false");

    if (memoBtn) {
      if (isActive) memoBtn.classList.add("is-visible");
      else memoBtn.classList.remove("is-visible");
    }

    // (선택) 텍스트 바꾸기
    var textEl = favBtn.querySelector(".trainer-card__fav-text");
    if (textEl) textEl.textContent = isActive ? "찜" : "찜하기";
  });
})();
