/*
 * 트레이너 검색 필터 이모지 누르면 뜨면 modal 
 * */

(function () {
  function qs(id) { return document.getElementById(id); }

  var openBtn = qs('openFilterBtn');
  var modal = qs('filterModal');
  var overlay = qs('filterOverlay');
  var closeBtn1 = qs('closeFilterBtn');
  var closeBtn2 = qs('closeFilterBtn2');

  if (!openBtn || !modal) return;

  function openModal() {
    modal.classList.add('is-open');
    modal.setAttribute('aria-hidden', 'false');
    document.body.classList.add('no-scroll');

    var panel = modal.querySelector('.modal-panel');
    if (panel) panel.focus();
  }

  function closeModal() {
    modal.classList.remove('is-open');
    modal.setAttribute('aria-hidden', 'true');
    document.body.classList.remove('no-scroll');
  }

  openBtn.addEventListener('click', openModal);

  if (overlay) overlay.addEventListener('click', closeModal);
  if (closeBtn1) closeBtn1.addEventListener('click', closeModal);
  if (closeBtn2) closeBtn2.addEventListener('click', closeModal);

  document.addEventListener('keydown', function (e) {
    e = e || window.event;
    var key = e.key || e.keyCode;
    if ((key === 'Escape' || key === 27) && modal.classList.contains('is-open')) {
      closeModal();
    }
  });
})();
