module Storyblok::Richtext
  module Marks
    class Superscript < Mark

      def matching
        @node['type'] === 'superscript'
      end

      def tag
        'sup'
      end
    end
  end
end