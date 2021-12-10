document.addEventListener("DOMContentLoaded", function(){
  const form = document.getElementById("form-medical");
  const previewSpace = document.getElementById("previews");
  if(!form) return null;
  const fileField = document.querySelector("input[type='file'][name='medical[images][]']");
  fileField.addEventListener("change", function(e){

    const dataIndex = e.target.getAttribute('data-index');
    console.log(dataIndex)

    alreadyImage = document.querySelector(".preview");
    if (alreadyImage) {
      alreadyImage.remove();
    }
    const file = e.target.files[0];
    const image = window.URL.createObjectURL(file);

    const parent = document.createElement("div");
    parent.setAttribute("class", "preview");
    parent.setAttribute("data-index", dataIndex);

    const child = document.createElement("img");
    child.setAttribute("class", "preview-image");
    child.setAttribute("src", image);
    parent.appendChild(child);
    previewSpace.appendChild(parent);

    const secondImage = document.createElement("input");
    secondImage.setAttribute("type", "file");
    secondImage.setAttribute("name", "medical[images][]");

    const secondImageSpace =  document.querySelector(".make-image");
    secondImageSpace.appendChild(secondImage);

  });
});