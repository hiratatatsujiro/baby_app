function index() {
  const menuBar = document.getElementById("menu_bar");
  const menuBox = document.getElementById("header_list_box");

  menuBar.addEventListener("click", function() {
    if (menuBox.getAttribute("style") == "display: block;") {
      menuBox.removeAttribute("style", "display: block;")
    } else {
      menuBox.setAttribute("style", "display: block;")
    }
  });
}


window.addEventListener("load", index);