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

    context "When string with whitespace is provided" do
      let(:input) { "   " }

      it "returns empty array" do
        expect(subject).to eq([])
      end
    end

    context "When string is just a number" do
      let(:input) { "42" }

      it "returns array with number as integer" do
        expect(subject).to eq([42])
      end
    end

    context "When there are multiple numbers with ',' as delimiter" do
      let(:input) { "1, 2, 3" }

      it "returns array with numbers as integers" do
        expect(subject).to eq([1, 2, 3])
      end
    end
  end
end