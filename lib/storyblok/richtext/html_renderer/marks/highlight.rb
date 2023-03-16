module Storyblok::Richtext
  module Marks
    class Highlight < Mark

      def matching
        @node['type'] === 'highlight'
      end

      def tag
        attrs = {
          style: "background-color:#{@node['attrs']['color']};"
        }
        [{
          tag: "span",
          attrs: attrs
        }]
      end
    end
  end
end
