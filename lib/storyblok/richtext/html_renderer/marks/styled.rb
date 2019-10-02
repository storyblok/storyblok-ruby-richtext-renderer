module Storyblok::Richtext
  module Marks
    class Styled < Mark

      def matching
        @node['type'] === 'styled'
      end

      def tag
        [{
          tag: "span",
          attrs: @node['attrs']
        }]
      end
    end
  end
end
