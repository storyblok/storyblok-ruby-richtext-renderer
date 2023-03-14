module Storyblok::Richtext
  module Marks
    class Subscript < Mark

      def matching
        @node['type'] === 'subscript'
      end

      def tag
        'sub'
      end
    end
  end
end