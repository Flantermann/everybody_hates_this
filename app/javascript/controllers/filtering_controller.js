// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form", "input", "list" ]

  update() {
    
    const filteredCheckbox = this.inputTargets.filter(element => {
      return element.checked
    });
    console.log(filteredCheckbox[0].value)
    let url = "";
    if(filteredCheckbox.length === 2) {
      let valueCategory = "";
    let valueTimeFrame = "";
      valueCategory = filteredCheckbox[0].name === "search[category]" ? filteredCheckbox[0] : filteredCheckbox[1];
      valueTimeFrame = filteredCheckbox[0].name === "search[timeframe]" ? filteredCheckbox[0] : filteredCheckbox[1];
       url = `${this.formTarget.action}?category=${valueCategory.value}&timeframe=${valueTimeFrame.value}`
    } else {
      const params = filteredCheckbox[0].name === "search[category]" ? "timeframe"  : "category"
      console.log(params)
     
      url = `${this.formTarget.action}?${params}=${filteredCheckbox[0].value}`
      console.log(url)
      
    }
   fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
this.listTarget.outerHTML = data;
     })
  }
}
