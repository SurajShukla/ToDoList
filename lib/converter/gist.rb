module Converter
  class Gist
    class ReaderContext
      def initialize(collection)
        @collection = collection
      end

      def get_binding
        binding
      end
    end

    attr_reader :collection

    def initialize(collection)
      @collection = collection
    end

    def convert
      binding = ReaderContext.new(collection).get_binding
      template.result binding
    end

    private

    def template
      ERB.new(document, nil, '-')
    end 

    def document
      @document ||= File.read(File.realdirpath('../../views/list.erb', __dir__))
    end
  end
end 
