import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() { }

    toggleForm(event) {
        console.log('clicked edit button');
        event.preventDefault();
        event.stopPropagation();
        const commentFormId = event.params["form"];
        const commentBodyId = event.params["body"];
        const form = document.getElementById(commentFormId);
        form.classList.toggle("d-none");
        form.classList.toggle("my-4");
        const commentBody = document.getElementById(commentBodyId)
        commentBody.classList.toggle("d-none");
    }
}
