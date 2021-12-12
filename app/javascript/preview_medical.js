document.addEventListener("DOMContentLoaded", function(){
  const form = document.getElementById("form-medical");
  const previewSpace = document.getElementById("previews");
  if(!form) return null;
  
    const buildPreviewImage = (dataIndex, image) => {

        const parent = document.createElement("div");
        parent.setAttribute("class", "preview");
        parent.setAttribute("data-index", dataIndex);

        const child = document.createElement("img");
        child.setAttribute("class", "preview-image");
        child.setAttribute("src", image);

        parent.appendChild(child);
        previewSpace.appendChild(parent);
    };
    
    const buildNewFileField = () => {
        const newImage = document.createElement("input");
        newImage.setAttribute("type", "file");
        newImage.setAttribute("name", "medical[images][]");

        const previewTag = document.querySelectorAll(".preview");
        newImage.setAttribute("data-index", previewTag.length);

        // const lastImage = document.querySelector("input[type='file'][name='medical[images][]']:last-child");
        // const lastIndex = Number(lastImage.getAttribute("data-index")) +1;
        // newImage.setAttribute("data-index", lastIndex);
        newImage.addEventListener("change", changedFileField);

        
        const newImageSpace =  document.querySelector(".make-image");
        newImageSpace.appendChild(newImage);     
    };
    
    const changedFileField = (e) => {
      const dataIndex = e.target.getAttribute('data-index');
      const file = e.target.files[0];
     
      const image = window.URL.createObjectURL(file);
     
      const alreadyPreview = document.querySelector(`.preview[data-index='${dataIndex}']`);
      if(alreadyPreview){
        const alreadyPreviewImage = alreadyPreview.querySelector("img");
        alreadyPreviewImage.setAttribute("src", image);
        return null;
      }; 

      buildPreviewImage(dataIndex, image);
      buildNewFileField();
    };


    const fileField = document.querySelector("input[type='file'][name='medical[images][]']");

    fileField.addEventListener("change", changedFileField);
});