require_relative 'spec_helper.rb'

describe List do
  let(:task1) { Task.create(description: "Feed the cat") }
  let(:task2) { Task.create(description: "Feed the cow", done: true) }
  let(:task3) { Task.create(description: "Feed the dog") }

  subject { described_class.new([task1, task2, task3]) }

  describe '#to_markdown' do
    List.const_set('TEMPLATE', ERB.new(DATA.read, nil, '-'))
    result = <<-HTML
    - [ ] Feed the cat 
    - [x] Feed the cow 
    - [ ] Feed the dog 
    HTML
    expect(subject.to_markdown).to eq(result)
  end
end


__END__
<% @tasks.each do |task| -%>
- [<%= task.done? ? 'x' : ' ' %>] <%= task %>
<% end -%>
