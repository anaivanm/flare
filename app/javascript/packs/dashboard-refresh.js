import swal from 'sweetalert';

console.log('hey from dashboard refresh');

function clickButton() {
  const button = document.querySelector(".monkeypants");
  button.click();
}

function getCurrentChatCount() {
  return document.querySelectorAll('#chat-list li').length
}

function refreshLogic() {
  clickButton();
  const nextCount = getCurrentChatCount();
  if (window.currentChatCount !== nextCount) {
    window.currentChatCount = nextCount;
    const refreshedList = document.querySelectorAll('#chat-list li');
    const name = refreshedList[refreshedList.length-1].querySelector('a').innerHTML
    console.log(name)
    swal({
        title: "New chat",
        text: `${name} started a new chat`
    });
  }
}

function refreshDashboard() {
  window.currentChatCount = getCurrentChatCount();
  setInterval(refreshLogic, 2000);
}

refreshDashboard();

console.log("refreshDashboard")
