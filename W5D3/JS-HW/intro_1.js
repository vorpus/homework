var madLib = function(verb, adj, noun) {
  var text = `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`;
  return text;
};

var isSubstring = function(searchString, subString) {
  for(var i = 0; i <= searchString.length - subString.length; i++) {
    if(searchString.slice(i,i + subString.length) == subString) {
      return true;
    }
    return false;
  }
};

var fizzBuzz = function(array) {
  var newArr = [];
  for (var i = 0; i < array.length; i++) {
    if (array[i] % 3 === 0 || array[i] % 5 === 0) {
      if (array[i] % 15 !== 0) {
        newArr.push(array[i]);
      }
    }
  }
  return newArr;
};

var isPrime = function(num) {
  for (var i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
};

var firstNPrimes = function(n) {
  var i = 0;
  var curnum = 1;
  var primes = [];
  while(i<n) {
    curnum++;
    if(isPrime(curnum)) {
      primes.push(curnum);
      i++;
    }
  }
  return primes;
};

var sumOfNPrimes = function(n) {
  var primes = firstNPrimes(n);
  var sum = 0;
  for (var i = 0; i < primes.length; i++) {
    sum += primes[i];
  }
  return sum;
};

var allOrNothing = function() {
  mod = arguments[0];
  for (var i = 1; i < arguments.length; i++) {
    if (arguments[i] % mod !== 0) {
      return false;
    }
  }
  return true;
};
