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
    
  });

}



window.addEventListener("load", ajax);