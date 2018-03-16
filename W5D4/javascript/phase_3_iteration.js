Array.prototype.bubbleSort = function() {
  let sorted = false;

  while (sorted === false) {
    sorted = true;
    for ( let i = 0; i + 1 < this.length; i++) {
      let j = i + 1;
      if (this[i] > this[j]) {
        let temp = this[i];
        this[i] = this[j];
        this[j] = temp;
        sorted = false;
      }
    }
  }
  return this;
};

String.prototype.subStrings = function() {
  let array = [];

  for ( let i = 0; i < this.length; i++ ) {
    for ( let j = i + 1; j < this.length; j++ ) {
      let substring = this.slice(i, j);
      array.push(substring);
    }
  }
  return array;
};

console.log("string".subStrings());
