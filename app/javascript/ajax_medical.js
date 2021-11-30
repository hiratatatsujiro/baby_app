const buildHTML = (XHR)=>{
  const item = XHR.response.medical_comment;
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
            ${item.content}
            </div>
          </div>
      `;
      return html;
};

function ajaxMedical(){
  const submitMedical = document.getElementById("submit-medical");
  submitMedical.addEventListener("click", (e)=>{
    e.preventDefault();
    const form = document.getElementById("form_medical");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    const url = location.pathname 
    XHR.open("POST", `${url}/medical_comments`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = ()=>{
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      };
      const listMedical = document.getElementById("list-medical");
      const formText = document.getElementById("form-content");
      listMedical.insertAdjacentHTML("afterend", buildHTML(XHR));
      formText.value = ""
    };
  });

}



window.addEventListener("load", ajaxMedical);