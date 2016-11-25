import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    // your code here
    this.state = {
      result: 0,
      num1: "",
      num2: ""
    };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.addNums = this.addNums.bind(this);
    this.subtractNums = this.subtractNums.bind(this);
  }

  setNum1 (event) {
    event.preventDefault();
    let newVal = parseInt(event.target.value);
    if (!newVal) {
      newVal = "";
    }

    this.setState({
      num1: newVal
    });
  }

  setNum2 () {
    event.preventDefault();
    debugger
    // let newVal = parseInt(document.querySelector("#num2").value);
    let newVal = parseInt(event.target.value);
    if (!newVal) {
      newVal = "";
    }

    this.setState({
      num2: newVal
    });
  }

  addNums () {

    let sum = this.state.num1 + this.state.num2;
    this.setState({
      result: sum
    });
  }

  subtractNums () {
    let difference = this.state.num1 - this.state.num2;
    this.setState({
      result: difference
    });
  }

  multiplyNums () {
    let product = this.state.num1 * this.state.num2;
    this.setState({
      result: product
    });
  }

  divideNums () {
    let quotient = this.state.num1 / this.state.num2;
    this.setState({
      result: quotient
    });
  }

  clearForm () {
    this.setState({
      result: 0,
      num1: "",
      num2: ""
    });
  }
  // your code here

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        <br/>
        <input type="text" id="num1" onChange={this.setNum1} value={this.state.num1}/>
        <input type="text" id="num2" onChange={this.setNum2} value={this.state.num2}/>
        <br/>
        <button type="button" onClick={this.addNums}>+</button>
        <button onClick={this.subtractNums}>-</button>
        <button onClick={this.multiplyNums.bind(this)}>*</button>
        <button onClick={this.divideNums.bind(this)}>/</button>
        <button onClick={this.clearForm.bind(this)}>Clear</button>
      </div>
    );
  }
}

export default Calculator;
