    
require './lib/calculator'

describe Calculator do
    describe "#add" do
        it "returns the sum of two numbers" do
            calculator = Calculator.new
            expect(calculator.add(5,2)).to eql(7)
        end
        it "returns the sum of more than two numbers" do
            calculator = Calculator.new
            expect(calculator.add(2,5,7)).to eql(14)
        end
    end

    describe "#multiply" do
        it "returns the product of two numbers" do
            calculator = Calculator.new
            expect(calculator.multiply(5,4)).to eql (20)
        end
        it "returns the product of two or more numbers" do
            calculator = Calculator.new
            expect(calculator.multiply(5,4,10)).to eql (200)
        end
    end

    describe '#subtract' do
        it "returns the diference of two numbers" do
            calculator = Calculator.new
            expect(calculator.subtract(3,5)).to eql (-2)
        end
        it "returns the difference of two or more numbers" do
            calculator = Calculator.new
            expect(calculator.subtract(3,5,10)).to eql (-12)
        end
    end
end