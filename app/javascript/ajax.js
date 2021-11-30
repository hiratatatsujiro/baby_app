const buildHTML = (XHR)=>{
  const item = XHR.response.comment;
      const userName = XHR.response.user_name
      const html = `
      <div class="comment-information">
        <div class="comment-user">
         投稿者：${userName}
        </div>
        <div class="comment-day">
          ${item.created_at}
        </div>
        <div class="comment-text">
          ${item.text}
        </div>
      </div>
      `;
      return html;
};

function ajax(){
  const submitDiary = document.getElementById("submit-diary");
  submitDiary.addEventListener("click", (e)=>{
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    const url = location.pathname 
    XHR.open("POST", `${url}/comments`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = ()=>{
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      };
      const list = document.getElementById("list");
      const formText = document.getElementById("form_text");
      list.insertAdjacentHTML("afterend", buildHTML(XHR));
      formText.value = ""
    };
  });

}



window.addEventListener("load", ajax);