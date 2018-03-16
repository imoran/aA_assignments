Array.prototype.uniq = function() {
  let array = [];

  this.forEach(function(el) {
    if (!array.includes(el)) {
      array.push(el);
    }
  });
  return array;
};


Array.prototype.twoSum = function() {
  let array = [];

  for (let i = 0;i < this.length;i++) {
    for(let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        array.push([i, j]);
      }
    }
  }
  return array;
};

Array.prototype.transpose = function() {
  let subarray = [];
  let array = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length; j++) {
      subarray.push( this[j][i] );
    }
    array.push(subarray);
    subarray = [];
  }
  return array;
};
