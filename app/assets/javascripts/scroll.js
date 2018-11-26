function scrollLastMessageIntoView() {
  const chatBox = document.getElementById('chatbox');
  const messages = document.querySelectorAll('.message');
  const lastMessage = messages[messages.length -1];
  chatBox.scrollTop = lastMessage.offsetTop;
}
