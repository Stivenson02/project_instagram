import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for the Postform Reflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
    // static targets=["dataorder"]

    initialize() {
        let element = document.getElementsByClassName('edit_publication')
        if (element.length == 0){
            let data_order = document.getElementById('data_order')
            data_order.className += " mb-4"
            console.log(data_order.className)
        }
    }

}
