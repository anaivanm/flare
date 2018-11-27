function clickButton() {
  const button = document.getElementById("monkeypants");
  button.click();
}

function refreshDashboard() {
  setInterval(clickButton, 2000);

}

refreshDashboard();
