var titleize = function(names, printCallback) {
  for (let i = 0; i < names.length; i++) {
    printCallback(`Mx. ${names[i]} Jingleheimer Schmidt`);
  }
};

function printCallback(name) {
  console.log(name);
}
