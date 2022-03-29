import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for the Carousel Reflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
    static targets = ["carousel_slide"]
    static values = {index: Number}

    show() {
        let elements = document.getElementsByClassName("carousel-item active")
        for (let i = 0; i < elements.length; i++) {
            elements[i].classList.remove("active")
        }
        let active_id="publication_content_"+this.indexValue
        let element = document.getElementById(active_id)
        element.classList.add("active")

    }


    // beforeDance(element, reflex, noop, reflexId) {
    //  element.innerText = 'Putting dance shoes on...'
    // }

    // danceSuccess(element, reflex, noop, reflexId) {
    //   element.innerText = '\nDanced like no one was watching! Was someone watching?'
    // }

    // danceError(element, reflex, error, reflexId) {
    //   console.error('danceError', error);
    //   element.innerText = "\nCouldn\'t dance!"
    // }

    // afterDance(element, reflex, noop, reflexId) {
    //   element.innerText = '\nWhatever that was, it\'s over now.'
    // }

    // finalizeDance(element, reflex, noop, reflexId) {
    //   element.innerText = '\nNow, the cleanup can begin!'
    // }
}
