import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-preview"
export default class extends Controller {
  static targets = [ "input", "preview" ]

  connect() {
    // Hide the preview container on connect if there's no initial image
    if (!this.previewTarget.querySelector('img')?.src) {
      this.previewTarget.style.display = 'none';
    }
  }

  // Action to be called when the file input changes
  preview() {
    let input = this.inputTarget
    let preview = this.previewTarget
    let file = input.files[0]

    if (file) {
      let reader = new FileReader()

      // Show the preview container
      preview.style.display = 'block';

      reader.onloadend = function () {
        // Find or create the image tag inside the preview target
        let img = preview.querySelector('img');
        if (!img) {
          img = document.createElement('img');
          img.classList.add("h-24", "w-24", "object-cover", "rounded-md");
          preview.innerHTML = ''; // Clear any existing content
          preview.appendChild(img);
        }
        img.src = reader.result
      }

      reader.readAsDataURL(file)
    }
  }
}