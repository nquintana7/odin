require "./enumerable"
include Enumerable

describe Enumerable do
    describe "#map" do
        it "should correctly yield the block given" do
            array = [0,1,2,3,4]
            array_result = ["Hola", "Hola", "Hola", "Hola", "Hola"]
            expect(array.my_map{|val| 
                "Hola"
            }).to eql(array_result)
        end

        it "should correctly yield the proc given" do
            array = [0,1,2,3,4]
            pro = Proc.new{{|val| "Hola"}
            array_result = ["Hola", "Hola", "Hola", "Hola", "Hola"]
            expect(array.my_map).to eql(array_result)
        end
    end
end