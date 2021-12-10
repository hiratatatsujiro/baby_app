document.addEventListener("DOMContentLoaded", function(){
  const form = document.getElementById("form-child");
  const previewSpace = document.getElementById("previews");
  if(!form) return null;
  const fileField = document.querySelector("input[type='file'][name='child[image]']");
  fileField.addEventListener("change", function(e){
    alreadyImage = document.querySelector(".preview");
    if (alreadyImage) {
      alreadyImage.remove();
    }
    const file = e.target.files[0];
    const image = window.URL.createObjectURL(file);
    const parent = document.createElement("div");
    parent.setAttribute("class", "preview");
    const child = document.createElement("img");
    child.setAttribute("class", "preview-image");
    child.setAttribute("src", image);
    parent.appendChild(child);
    previewSpace.appendChild(parent);
  });
});