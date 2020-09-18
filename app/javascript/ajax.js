function ajax() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {

    const formClass = document.querySelector(".form");
    const formId = formClass.getAttribute("data-id");
    
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `/rooms/${formId}/chats`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.chat;
      const list = document.getElementById("list");
      const formText = document.getElementById("message");
      const formName = document.getElementById("name");
      const HTML = `
        <div class="chat-main" data-id=${item.id}>
          <div class="chat-upper">
            名前:${item.name} 投稿日時：${item.created_at}
          </div>
          <div class="chat-lower">
            <div>
              ${item.message}
            </div>
            <img src = ${item.image.url}>
          </div>
        </div>`;
      list.insertAdjacentHTML("afterend", HTML);
      formName.value = item.name;
      formText.value = "";
    };
    e.preventDefault();
  });
 }
 window.addEventListener("load", ajax);