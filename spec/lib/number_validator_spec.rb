require_relative '../../lib/number_validator'

RSpec.describe NumberValidator do
  let(:input) { [] }

  subject { NumberValidator.call!(input) }

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
  end
end