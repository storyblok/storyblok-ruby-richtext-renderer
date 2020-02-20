module Storyblok::Richtext
  module Marks
    class Italic < Mark

      def matching
        @node['type'] == 'italic' || @node['type'] == 'i' || @node['type'] == 'em'
      end

      def tag
        'i'
      end
    end
  end
end
