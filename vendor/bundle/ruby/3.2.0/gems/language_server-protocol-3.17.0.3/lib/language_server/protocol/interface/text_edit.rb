module LanguageServer
  module Protocol
    module Interface
      class TextEdit
        def initialize(range:, new_text:)
          @attributes = {}

          @attributes[:range] = range
          @attributes[:newText] = new_text

          @attributes.freeze
        end

        #
        # The range of the text document to be manipulated. To insert
        # text into a document create a range where start === end.
        #
        # @return [Range]
        def range
          attributes.fetch(:range)
        end

        #
        # The string to be inserted. For delete operations use an
        # empty string.
        #
        # @return [string]
        def new_text
          attributes.fetch(:newText)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
