function refreshChatBanner() {
  const banner = document.querySelector('.no-helper');
  const refreshButton = document.querySelector('.refresh-chat-banner')
  if (banner) {
    let callRefresh = setInterval(refresh, 2000);
    function refresh() {
      if (document.querySelector('.added-helper')) {
        clearInterval(callRefresh);
      } else {
        refreshButton.click();
      }
    }
  }
}

refreshChatBanner();


