module Storyblok::Richtext
  module Marks
    class Italic < Mark

      def matching
        ['italic', 'i', 'em'].include?(@node['type'])
      end

      def tag
        'i'
      end
    end
  end
end
