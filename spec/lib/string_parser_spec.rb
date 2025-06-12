require_relative '../../lib/string_parser'

RSpec.describe StringParser do
  let(:input) { '' }
  subject { StringParser.call(input) }

  describe '#call' do
    context "When empty string is provided" do
      it "returns empty array" do
        expect(subject).to eq([])
      end
    end
  end
end