import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    open(event) {
        document.getElementById("edit_popup_form").style.display = "block";
        document.getElementById("edit_blur_background").style.display = "block";
        document.body.style.overflow = "hidden";
    }

    close(event) {
        document.getElementById("edit_popup_form").style.display = "none";
        document.getElementById("edit_blur_background").style.display = "none";
        document.body.style.overflow = "visible";
    }
}