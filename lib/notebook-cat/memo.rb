require 'redcarpet'
require 'yaml'

module NotebookCat

  class Memo

    def initialize(markdown)
      @markdown = markdown
    end

    def self.read(path)
      Memo.new(File.read(path))
    end

    def count
      @count ||= @markdown.split(//).size
    end

    def contents
      if !@contents
        renderer = Renderer.new
        # extensions = {
        #
        # }
        Redcarpet::Markdown.new(
          renderer,
          fenced_code_blocks: true,
          footnotes: true
        ).render(@markdown)
        @contents = renderer.contents
      end
      @contents
    end

    class Renderer < Redcarpet::Render::HTML

      def contents
        @contents ||= []
      end

      def block_code(code, language)
        contents << {
          type: :block_code,
          code: code,
          language: language
        }
        return nil
      end

      def block_quote(quote)
        # TODO remove duplicated block_quote.quote and paragraph.text
        contents << {
          type: :block_quote,
          quote: quote
        }
        return nil
      end

      def block_html(raw_html)
        contents << {
          type: :block_html,
          raw_html: raw_html
        }
        return nil
      end

      def footnotes(content)
        return nil
      end

      def footnote_def(content, number)
        # TODO remove duplicated footnote_def.content and paragraph.text
        contents << {
          type: :footnote_def,
          content: content,
          number: number,
        }
        return nil
      end

      def footnote_ref(number)
        return "[#{number}]"
      end

      def paragraph(text)
        contents << {
          type: :paragraph,
          text: text
        }
        return text
      end

      def header(text, header_level)
        contents << {
          type: :header,
          text: text,
          header_level: header_level
        }
        return nil
      end

      def hrule()
        contents << {
          type: :hrule
        }
        return nil
      end

      def list(items, list_type)
        target_index = nil
        contents.each.with_index do |content, index|
          if content[:type] == :list
            target_index = index
          end
        end
        b = YAML.load(items)
        if target_index && b.include?(contents[target_index][:items])
          contents.delete_at(target_index)
        end
        contents << {
          type: :list,
          items: b,
          list_type: list_type
        }
        return "- \n" + items.gsub("- ", "  - ")
      end

      def list_item(text, list_type)
        return "- #{text.chomp}\n"
      end

      # TODO support table
      # table(header, body)
      # table_row(content)
      # table_cell(content, alignment)

    end

  end

end
