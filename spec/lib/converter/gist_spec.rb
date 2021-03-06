require_relative '../../spec_helper.rb'

describe Converter::Gist do
  subject { described_class.new([:a, :b]) }

  describe "#initialize" do
    context 'one argument recives' do
      it 'creates' do
        expect(subject.collection).to eq([:a, :b])
      end
    end

    context 'no argument is supplied' do
      it 'raises argument error' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#convert' do
    let(:template) { double("Template") }
    let(:binding) { double('Binding') }

    it 'converts the collection to a GitHub markdown emplate' do
      allow(subject).to receive(:template).and_return(template)
      allow(template).to receive(:result).with(binding)
      expect_any_instance_of(Converter::Gist::ReaderContext).to receive(:get_binding) { binding }
      expect(template).to receive(:result).with(binding)
      subject.convert
    end
  end
end
