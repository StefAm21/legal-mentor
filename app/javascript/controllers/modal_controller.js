import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['recipient', 'message'];

  connect() {
    this.modal = new bootstrap.Modal(this.element);
  }

  openModal(event) {
    const button = event.currentTarget;
    const recipient = button.getAttribute('data-bs-whatever');
    this.recipientTarget.value = recipient;
    this.modal.show();
  }

  sendMessage() {
    const recipient = this.recipientTarget.value;
    const message = this.messageTarget.value;
    // Add code here to send the message using AJAX or another method
    this.modal.hide();
  }
}
