require_relative 'spec_helper.rb'

describe List do
  subject { described_class.new([:task]) }

  describe "#initialize" do
    context 'one argument recives' do
      it 'creates' do
        expect(subject.lists).to eq([:task])
      end
    end

    context 'no argument is supplied' do
      it 'raises argument error' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
  end
  
  describe '#to_gist' do
    it 'converts the list to a Github\'s gist' do
      expect_any_instance_of(Converter::Gist).to receive(:convert).with(no_args)
      expect(Gist).to receive(:gist).with(any_args)
      subject.to_gist
    end
  end
end
