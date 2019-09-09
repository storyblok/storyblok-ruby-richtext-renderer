module Storyblok::Richtext
  module Nodes
    class HardBreak < Node

      def matching
        @node['type'] === 'hard_break'
      end

      def single_tag
        'br'
      end
    end
  end
end
