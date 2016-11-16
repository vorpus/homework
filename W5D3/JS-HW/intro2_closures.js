function dinerBreakfast() {
  var allOrder = "I'd like scrambled eggs please.";
  var order = function(item) {
    allOrder = allOrder.slice(0, allOrder.length - 8) + ' and ' + item + ' please.';
    console.log(allOrder);
  };
  return order;
}
let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");
