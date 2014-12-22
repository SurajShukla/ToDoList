module Export
  class GitHubMarkdownTemplate
    attr_writer :document

    def to_markdown(binding)
      template = ERB.new(document, nil, '-')
      template.result(binding)
    end

    private

    def document
      @document ||= File.read(File.realdirpath('../../views/list.erb', __dir__))
    end
  end
end
