require_relative '../../spec_helper.rb'

describe Export::GitHubMarkdownTemplate do
  let(:output) { "I have 1 cat" }
  let(:klass) do
    Class.new do
      def initialize
        @number_of_cats = 1
      end

      def get_binding
        binding
      end
    end
  end
  let(:binding_object) { klass.new.get_binding }

  subject { described_class.new }

  before { subject.document = %(I have <%= @number_of_cats %> cat<% -%>) }

  it 'returns the Github markdown template' do
    expect(subject.to_markdown(binding_object)).to eq(output)
  end
end
