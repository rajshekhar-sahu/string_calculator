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
  end
end
