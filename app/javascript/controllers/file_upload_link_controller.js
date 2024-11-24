import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['filePicker']
  static classes = []
	connect() {

	}

  submit() {
    this.element.submit()
  }

	open(event){
    event.preventDefault()
    this.filePickerTarget.click()
  }
}
