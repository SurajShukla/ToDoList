require_relative '../../spec_helper.rb'

describe Converter::Gist do
  subject { described_class.new([:a, :b]) }

  describe '#convert' do
    let(:template) { double("Template", :result => 'template') }

    it 'converts the collection to a GitHub markdown emplate' do
      allow_any_instance_of(Converter::Gist::ReaderContext).to receive(:get_binding) { binding }
      expect(template).to receive(:result).with(binding)
      subject.convert
    end
  end
end
