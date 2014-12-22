module Export
  class GitHubMarkdownTemplate
    attr_accessor :document

    def initialize
      @document = File.read(File.realdirpath('../../views/list.erb', __dir__))
    end

    def to_markdown(binding)
      template = ERB.new(document, nil, '-')
      template.result(binding)
    end
  end
end
