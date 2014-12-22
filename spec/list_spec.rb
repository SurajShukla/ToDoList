require_relative 'spec_helper.rb'

describe List do
  let(:task1) { Task.create(description: "Feed the cat") }
  let(:task2) { Task.create(description: "Feed the cow", done: true) }
  let(:task3) { Task.create(description: "Feed the dog") }

  subject { described_class.new([task1, task2, task3]) }

  describe '#to_markdown' do
    it 'converts the HTML file to GitHub markdown' do
      html = <<-ERB
      <% @tasks.each do |task| -%>
      - [<%= task.done? ? 'x' : ' ' %>] <%= task %>
      <% end -%>
      ERB
      List.compile_html_to_erb(html: html)
      result = <<-HTML
      - [ ] Feed the cat
      - [x] Feed the cow
      - [ ] Feed the dog
      HTML
      expect(subject.to_markdown).to eq(result)
    end
  end
end
