import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() { }

    toggleForm(event) {
        console.log('clicked edit button');
        event.preventDefault();
        event.stopPropagation();
        const commentFormId = event.params["form"];
        const commentBodyId = event.params["body"];
        const editButtonId = event.params["edit"];

        const form = document.getElementById(commentFormId);
        const commentBody = document.getElementById(commentBodyId)
        const editButton = document.getElementById(editButtonId)

        form.classList.toggle("d-none");
        form.classList.toggle("my-4");
        commentBody.classList.toggle("d-none");
        this.toggleButton(editButton);
    }

    toggleButton(editButton) {
        if (editButton.innerText === "Edit") {
            editButton.innerText = "Cancel"
            this.toggleEditButtonClass(editButton)
        }
        else {
            editButton.innerText = "Edit"
            this.toggleEditButtonClass(editButton)
        }
    }

    toggleEditButtonClass(editButton) {
        editButton.classList.toggle("btn-secondary")
        editButton.classList.toggle("btn-warning")
    }
}
