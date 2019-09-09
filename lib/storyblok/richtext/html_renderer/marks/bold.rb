module Storyblok::Richtext
  module Marks
    class Bold < Mark

      def matching
        @node['type'] === 'bold'
      end

      def tag
        'b'
      end
    end
  end
end
