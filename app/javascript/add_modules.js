import "@hotwired/turbo-rails"
import "controllers"

function openForm() {
    if(formOpen == false){
        formOpen = true;

        document.getElementById('testP').innerHTML = "This is a test";
    }
}

let formOpen = false;

moduleButton = document.getElementById("add_module_button");
moduleButton.addEventListener("click", openForm);