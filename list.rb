require_relative "./lib/export/github_markdown_template.rb"

class List
  def initialize(lists)
    @lists = lists
  end

  def to_gist
    Gist.gist(build_gist_template, filename: 'To Do List.md')
  end

  private

  def build_gist_template
    Export::GitHubMarkdownTemplate.new.to_markdown(binding)
  end
end
