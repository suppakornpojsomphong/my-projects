let dropdownBtn = document.getElementById("drop-text");
let list = document.getElementById("list");
let icon = document.getElementById("icon");

let category = document.getElementById("category");
let image = document.getElementById("idimage");

let listItems = document.querySelectorAll(".dropdown-list-item");

// Shpw Dropdown list on click on Dropdown button
dropdownBtn.onclick = function () {
    //rotate Arrow icon
    if (list.classList.contains("show")) {
        icon.style.rotate = "0deg";
    }
    else {
        icon.style.rotate = "-180deg";
    }
    list.classList.toggle("show");
};

//Hide Dropdown list when clicked outside the Dropbos button
window.onclick = function (e) {
    if (
        e.target.id !== "drop-text" &&
        e.target.id !== "icon" &&
        e.target.id !== "image"
    ) {
        list.classList.remove("show");
        icon.style.rotate = "0deg";
    }
};

for (item of listItems) {
    item.onclick = function (e) {
        //Change the TEXT in dropbox when click on selected List item
        category.innerText = e.target.innerText;
    };
}

