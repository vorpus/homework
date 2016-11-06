require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without
 blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double(:titleize => "chefboyardee") }

  subject(:dessert) do
    Dessert.new("cake", 5, chef)
  end

  describe "#initialize" do

    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {eat(6)}.to raise_error
    end
  end

  describe "#add_ingredient" do

    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("quinoa")
      expect(dessert.ingredients).to eq(["quinoa"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("quinoa")
      dessert.add_ingredient("spinach")
      dessert.add_ingredient("pepper")
      dessert.add_ingredient("cats")
      dessert.mix!
      expect(dessert.ingredients.sort).to eq(["cats","pepper","quinoa","spinach"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(1)
      expect(dessert.quantity).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {dessert.eat(6)}.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      dessert.serve
      expect(dessert.serve).to include("chef")
    end
  end

  describe "#make_more" do
    subject(:dessert) do
      Dessert.new("cake", 5, chef)
    end

    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake)
      dessert.make_more
    end
  end
end
