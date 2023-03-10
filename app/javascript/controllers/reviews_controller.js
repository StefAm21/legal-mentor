import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['modal']

  connect() {
    this.modal = new bootstrap.Modal(this.element);
  }

  showModal() {
    this.modalTarget.classList.add('show')
    document.body.classList.add('modal-open')
  }

  hideModal() {
    this.modalTarget.classList.remove('show')
    document.body.classList.remove('modal-open')
  }
}
