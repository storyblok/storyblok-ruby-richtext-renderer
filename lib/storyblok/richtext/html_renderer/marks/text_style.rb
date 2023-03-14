module Storyblok::Richtext
  module Marks
    class TextStyle < Mark

      def matching
        @node['type'] === 'textStyle'
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