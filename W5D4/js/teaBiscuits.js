const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let first, second;

reader.question("Would you like tea?", (answer) => {
  first = answer;
  console.log(`So you ${answer} want tea.`);

  reader.question("Would you like biscuits?", (answer) => {
    second = answer;
    console.log(`You replied ${second}`);
    console.log(`${first} tea and ${second} biscuits.`);
    reader.close();
  });
});
