function reload() {
  const formClass = document.querySelector(".form");
  const formId = formClass.getAttribute("data-id");

  const chats = document.querySelectorAll(".chat-upper");
  chats.forEach(function(chat) {
    const chatId = chat.getAttribute("chat-id");

    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/rooms/${formId}/chats`, true);
    XHR.responseType = "json";
    XHR.send();
    XHR.onload = () => {

      const newItem = XHR.response.json;

  }
  });


}

window.addEventListener("load", reload);

//setInterval(reload, 10000);