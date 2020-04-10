require "./caesar_cipher"

describe Caesar do
    describe "#5positions" do
        it "Tests easiest case positive, small number" do
            expect(Caesar.caesar_cipher("What a String!", 5)).to eql("Bmfy f Xywnsl!")
        end
    end

    describe "#symbols" do
        it "Tests if it ignores symbols and numbers" do
            expect(Caesar.caesar_cipher("Wha!+.t a123 String!", 5)).to eql("Bmf!+.y f123 Xywnsl!")
        end
    end

    describe "#negative" do
        it "Tests if negative number works" do
            expect(Caesar.caesar_cipher("SAPE!-32ha",-5)).to eql("NVKZ!-32cv")
        end
    end

    describe "#bignumber" do
        it "Tests with bigger number than alphabet's length" do
            expect(Caesar.caesar_cipher("SUPER STRING",30)).to eql("WYTIV WXVMRK")
        end
    end
end