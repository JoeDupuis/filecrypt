import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String
  }
  connect() {
  }

  copy() {
    navigator.clipboard.writeText(this.urlValue)
    window.location.href = "/"
  }
}
