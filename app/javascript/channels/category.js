import Rails from "@rails/ujs"
const initCategoryForm = () => {
    var checkBoxes = document.querySelectorAll(".form-check-input");
    var form = document.getElementById('category-form');

    for (const check of checkBoxes) {
    check.addEventListener( 'change', function(event) {
        event.preventDefault()
        if(this.checked) {
          console.log("checked")
          Rails.ajax({
            url: `/missions?category=${check.value}`,
            type: 'get',
          });     
        } else {
          console.log("unchecked")
        }
    });
    }
}

export { initCategoryForm }