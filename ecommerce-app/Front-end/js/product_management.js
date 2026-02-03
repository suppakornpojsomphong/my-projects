let deleteBtns = document.querySelectorAll(".delete");
let cancelBtn = document.getElementById("cancel");
let confirmDeleteBtn = document.getElementById("confirmDelete");
let popup = document.getElementById("deleteConfirmationPopup");

// Function to show the delete confirmation popup
function showDeleteConfirmationPopup() {
    popup.classList.add("active");
}

// Function to hide the delete confirmation popup
function hideDeleteConfirmationPopup() {
    popup.classList.remove("active");
}

// Add click event listeners to all delete buttons
deleteBtns.forEach(function(btn) {
    btn.onclick = function() {
        showDeleteConfirmationPopup();
    }
});

// Add click event listener to cancel button in delete confirmation popup
cancelBtn.onclick = function() {
    hideDeleteConfirmationPopup();
}

// Add click event listener to confirm delete button in delete confirmation popup
confirmDeleteBtn.onclick = function() {
    // Perform delete operation here (e.g., delete from database)
    // For demonstration purposes, let's just log a message
    console.log("Product deleted");
    // Hide the delete confirmation popup
    hideDeleteConfirmationPopup();
}

// Close the delete confirmation popup when clicking outside of it
window.onclick = function(e) {
    if (e.target === popup) {
        hideDeleteConfirmationPopup();
    }
}

// Select all edit buttons
let editBtns = document.querySelectorAll(".edit");

// Add click event listeners to all edit buttons
editBtns.forEach(function(btn) {
    btn.addEventListener("click", function() {
        window.location.href = "edit_product.html";
    });
});

// Redirect to add product page when add product button is clicked
let addProductBtn = document.getElementById("addbn");

addProductBtn.onclick = function() {
    window.location.href = "add_product.html"; // Replace "add_product.html" with the URL of your add product page
}
