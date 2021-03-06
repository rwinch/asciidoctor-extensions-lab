require 'asciidoctor'
require 'asciidoctor/extensions'

include ::Asciidoctor

# A preprocessor that adds hardbreaks to the end of all lines.
Extensions.register {
  preprocessor {
    process {|document, reader|
      Reader.new reader.readlines.map {|l|
        (l.empty? || (l.start_with? '=')) ? l : %(#{l} +)
      }
    }
  }
}
