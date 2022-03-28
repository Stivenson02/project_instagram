import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for the Postform Reflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
    static targets=["data"]

     initialize() {
        console.log(this.dataTargets)
     }


}
