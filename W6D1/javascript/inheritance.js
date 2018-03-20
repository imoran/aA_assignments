// Function.prototype.inherits = function (Parent) {
//   function Surrogate() {}
//   Surrogate.prototype = Parent.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// };

Function.prototype.inherits = function(Parent) {
  this.prototype = Object.create(Parent.prototype);
  this.prototype.constructor = this;
};


function MovingObject (name) {
  this.name = name;
  this.speed = 0;
}

MovingObject.prototype.increaseSpeed = function () {
  this.speed += 10;
  return this.speed;
};

let car = new MovingObject("carrie");
// console.log(car.increaseSpeed());

function Ship (name) {
  MovingObject.call(this, name);
}

Ship.inherits(MovingObject);

Ship.prototype.raiseFlag = function(color) {
  console.log(`${this.name} raises the ${color} Flag!`);
};


let boatyMcBoatface = new Ship("boatyMcBoatface");
// console.log(boatyMcBoatface.increaseSpeed());


function Asteroid (name) {
  MovingObject.call(this, name);
}
Asteroid.inherits(MovingObject);
