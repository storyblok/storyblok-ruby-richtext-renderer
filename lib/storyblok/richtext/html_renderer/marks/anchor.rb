module Storyblok::Richtext
  module Marks
    class Anchor < Mark

      def matching
        @node['type'] === 'anchor'
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
