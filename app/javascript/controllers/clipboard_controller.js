import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['source']

  copy (e) {
    e.preventDefault()

    var dummy = document.createElement('textarea')
    document.body.appendChild(dummy)
    dummy.value = this.sourceTarget.href
    dummy.select()
    document.execCommand('copy')
    document.body.removeChild(dummy)
  }
}
