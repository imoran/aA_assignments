Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function(callback) {
  let array = [];

  this.myEach(function(el) {
    array.push(callback(el));
  });
  return array;
};

const myFunc = function(acc, el) {
  return acc * el;
};

Array.prototype.myReduce = function(callback, initialValue) {
  let acc = initialValue || this[0];

  this.myEach(function(el) {
    acc = callback(acc, el);
  });
  return acc;
};
