function sum() {
  let args = Array.from(arguments);

  let rollingSum = 0;
  for (let i = 0; i < args.length; i++) {
    rollingSum += args[i];
  }
  return rollingSum;
}

function sum2(...args) {
  let rollingSum = 0;

  for (var i = 0; i < args.length; i++) {
    rollingSum += args[i];
  }

  return rollingSum;
}

// console.log(sum2(1, 2, 3, 4)); //10
// console.log(sum2(1, 2, 3, 4, 5)); //15


class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

Function.prototype.myBind = function (ctx) {
  let bindArgs = Array.from(arguments).slice(1);
  let self = this;
  return function() {
    let callArgs = Array.from(arguments);
    return self.apply(ctx, bindArgs.concat(callArgs));
  };
};

Function.prototype.yourBind = function (ctx, ...bindArgs) {
  return (...otherArgs) => {
    console.log("CTX", ctx);
    this.apply(ctx, bindArgs.concat(otherArgs));
  };
};

console.log(Cat.prototype.says.yourBind(breakfast, "meow")('Markov'));

let curriedSum = function(numArgs) {
  let numbers = [];

  let _curriedSum = function(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      return numbers.reduce((accumulator, currentValue) => accumulator + currentValue);
    } else {
      return _curriedSum;
    }
  };

  return _curriedSum;
};

Function.prototype.curry = function (numArgs) {
  let numbers = [];

  let _curry = (num) => {
    numbers.push(num);

    if (numbers.length === numArgs) {
      return this.apply(this, numbers);
    } else {
      return _curry;
    }
  };

  return _curry;
};
let spicySum = sum.curry(4);
// console.log(spicySum(5)(30)(20)(1));
