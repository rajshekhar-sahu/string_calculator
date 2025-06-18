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

    context "When input string contains newline" do
      let(:input) { "1, 2\n3\n4" }

      it "returns array with numbers as integers" do
        expect(subject).to eq([1, 2, 3, 4])
      end
    end

    context "When a custom delimiter is provided in input string" do
      let(:input) { "//;\n1;2;3" }

      it "returns array with numbers as integers" do
        expect(subject).to eq([1, 2, 3])
      end
    end

    context "When input contains number bigger than 1000" do
      let(:input) { "1, 2, 1001" }

      it "ignores numbers bigger than 1000" do
        expect(subject).to eq([1, 2])
      end
    end

    context "When custom delimiter's length is greater than 1" do
      let(:input) { "//[***]\n1***2***3" }

      it "returns array with numbers as integers" do
        expect(subject).to eq([1, 2, 3])
      end
    end

    context "When there are multiple custom delimiters" do
      let(:input) { "//[***][%%%]\n1***2%%%3" }

      it "returns array with numbers as integers" do
        expect(subject).to eq([1, 2, 3])
      end
    end

    context "When input is single quoted string with newline character" do
      let(:input) { '1, 2\n3' }

      it "returns array with numbers as integers" do
        expect(subject).to eq([1, 2, 3])
      end
    end

    context "When provide_del flag is provided" do
      let(:input) { "//[***][%%%]\n1***2%%%3" }
      subject { StringParser.call(input, true) }

      it 'should return delimiters as well' do
        expect(subject).to match_array([[1, 2, 3], ['***', '%%%']])
      end
    end
  end
end