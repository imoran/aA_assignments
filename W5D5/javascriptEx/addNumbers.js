const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const addNumbers = function (sum, numsLeft, callback) {

  let num;

  const innerCall = function(res) {
    num = parseInt(res);
    console.log(`You replied ${num}.`);
    while (numsLeft > 0) {
      sum += num;
      numsLeft--;
      console.log(sum);
      addNumbers(sum, numsLeft, callback);
    }
    reader.close();
  };


  if (numsLeft > 0) {
    reader.question('Number?', innerCall);
    // num = parseInt(res);
    //
    // console.log(`You replied ${num}.`);
    // reader.close();
    // console.log(num);
    // );
  }

};


addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
// console.log(addNumbers(0,4));       /
