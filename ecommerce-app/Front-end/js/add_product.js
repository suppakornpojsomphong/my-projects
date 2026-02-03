var addContainers = document.querySelectorAll(".Add-container");

var loadFile = function (event) {
    var container = event.target.closest(".Add-container");
    var deleteButton = container.querySelector(".delete");
    container.style.backgroundImage = "url(" + URL.createObjectURL(event.target.files[0]) + ")";
    deleteButton.style.display = "block"; // Show delete button after image upload
}

var deleteImage = function (button) {
    var container = button.closest(".Add-container");
    var input = container.querySelector('input[type="file"]');
    var deleteButton = container.querySelector(".delete");
    container.style.backgroundImage = ""; // Clear background image
    input.value = ""; // Clear file input value
    deleteButton.style.display = "none"; // Hide delete button

}


var containers = document.querySelectorAll('.Add-container');
containers.forEach(function (container) {
    var input = container.querySelector('input[type="file"]');
    input.addEventListener('change', loadFile);

    var deleteButton = container.querySelector('.delete');
    deleteButton.addEventListener('click', function () {
        deleteImage(deleteButton);
    });
});

