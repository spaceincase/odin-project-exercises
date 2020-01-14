#spec/calculator_spec.rb
require './lib/calculator.rb'
describe Calculator do
  calculator = Calculator.new
  describe "#add" do
    it "returns the sum of two numbers" do
      expect(calculator.add(5, 2)).to eql(7)
    end

    it "returns the sum of many numbers" do
      expect(calculator.add(2,5,7)).to eql(14)
    end
  end

  describe "#multiply" do
    it "mulplies two numbers" do
      expect(calculator.multiply(2,2)).to eql(4)
    end

    it "multiplies many numbers" do
      expect(calculator.multiply(2,2,2)).to eql(8)
    end
  end

  describe "#subtract" do
    it "subtracts two numbers" do
      expect(calculator.subtract(6,4)).to eql(2)
    end

    it "subtracts many numbers" do
      expect(calculator.subtract(10,2,4)).to eql(4)
    end
  end

  describe "#divide" do
    it "divdes two numbers" do
      expect(calculator.divide(64,8)).to eql(8)
    end

    it "divides many numbers" do
      expect(calculator.divide(64,8,4)).to eql(2)
    end
  end

end
