function refreshChatBanner() {
  console.log('inside refresh chat banner function');
  const banner = document.querySelector('.no-helper');
  const refreshButton = document.querySelector('.refresh-chat-banner')
  if (banner) {
    console.log('inside banner conditional');
    let callRefresh = setInterval(refresh, 2000);
    function refresh() {
      console.log('inside setInterval function');
      if (document.querySelector('.added-helper')) {
        console.log('clearing interval');
        clearInterval(callRefresh);
      } else {
        refreshButton.click();
      }
    }
  }
}

refreshChatBanner();
