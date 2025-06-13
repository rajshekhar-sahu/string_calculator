require_relative '../../lib/string_calculator'

RSpec.describe StringCalculator do
  let(:input) { '' }
  subject { StringCalculator.call(input) }

  describe '#call' do
    context "When empty string is provided" do
      it "returns 0" do
        expect(subject).to eq(0)
      end
    end

    context "When a single number is provided" do
      let(:input) { '5' }

      it "returns the number" do
        expect(subject).to eq(5)
      end
    end

    context "When multiple numbers are provided with ',' as delimiter" do
      let(:input) { '1,2,3' }

      it "returns the sum of the numbers" do
        expect(subject).to eq(6)
      end
    end

    context "When multiple numbers are provided with newline as delimiter" do
      let(:input) { "1\n2\n3" }

      it "returns the sum of the numbers" do
        expect(subject).to eq(6)
      end
    end

    context "When a custom delimiter is provided" do
      let(:input) { "//;\n1;2;3" }

      it "returns the sum of the numbers" do
        expect(subject).to eq(6)
      end
    end

    context "When input contains negative numbers" do
      let(:input) { "1,-2,3" }

      it "raises an ArgumentError with negative numbers" do
        expect { subject }.to raise_error(ArgumentError, "negative numbers are not allowed: -2")
      end
    end

    context "When input contains multiple negative numbers" do
      let(:input) { "1,-2,-3" }

      it "raises an ArgumentError with all negative numbers" do
        expect { subject }.to raise_error(ArgumentError, "negative numbers are not allowed: -2, -3")
      end
    end
  end
end
