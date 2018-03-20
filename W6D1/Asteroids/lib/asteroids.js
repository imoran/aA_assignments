console.log("webpack is working!");
const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");
window.MovingObject = MovingObject;



function Asteroid(optionsObj) {
  let sizes = [10, 20, 20, 50, 50, 50, 100];
  this.COLOR = "#808080";
  this.RADIUS = sizes[Math.floor(Math.random()*sizes.length)];

  let options = {
    pos: optionsObj.pos,
    vel:
    color: #808080,
    radius: this.RADIUS
  };

  MovingObject.call(this, options);
}



Util.inherits()
