require_relative '../../lib/negative_number_validator'

RSpec.describe NegativeNumberValidator do
  let(:input) { [] }

  subject { NegativeNumberValidator.call!(input) }

  describe '#call' do
    context "When input is empty array" do
      it "returns empty array" do
        expect(subject).to eq([])
      end
    end

    context "When input contains all positive numbers" do
      let(:input) { [1, 2, 3] }

      it "returns the input array" do
        expect(subject).to eq(input)
      end
    end

    context "When input contains negative numbers" do
      let(:input) { [1, -2, 3] }

      it "raises an ArgumentError" do
        expect { subject }.to raise_error(ArgumentError, "negative numbers are not allowed: -2")
      end
    end

    context "When input contains multiple negative numbers" do
      let(:input) { [1, -2, -3] }

      it "raises an ArgumentError with all negative numbers" do
        expect { subject }.to raise_error(ArgumentError, "negative numbers are not allowed: -2, -3")
      end
    end
  end
end