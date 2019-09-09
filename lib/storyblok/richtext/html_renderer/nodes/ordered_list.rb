module Storyblok::Richtext
  module Nodes
    class OrderedList < Node

      def matching
        @node['type'] === 'ordered_list'
      end

      def tag
        'ol'
      end
    end
  end
end
