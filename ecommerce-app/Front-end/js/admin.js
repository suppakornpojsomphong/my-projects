let add_popup = document.getElementById("popup-1");
let addBtn = document.getElementById("open");
let cancelBtn = document.getElementById("cancel");

addBtn.onclick = function togglePopup() {
    add_popup.classList.toggle("active");
}
cancelBtn.onclick = function removePopup() {
    add_popup.classList.remove("active");
}


window.onclick = function(e) {
    if( e.target.id != "open" &&
        e.target.classList == "overlay"
    ) {
        add_popup.classList.remove("active");
    }
}
