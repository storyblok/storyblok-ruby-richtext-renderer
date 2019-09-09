module Storyblok::Richtext
  module Marks
    class Underline < Mark

      def matching
        @node['type'] === 'underline'
      end

      def tag
        'u'
      end
    end
  end
end
