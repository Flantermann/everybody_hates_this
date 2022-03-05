import Rails from "@rails/ujs"
const initCategoryForm = () => {
    var checkBoxes = document.querySelectorAll(".form-check-input");
    var form = document.getElementById('category-form');

    for (const check of checkBoxes) {
    check.addEventListener( 'change', function() {
    Rails.fire(form, 'submit');
    });
    }
}

export { initCategoryForm }