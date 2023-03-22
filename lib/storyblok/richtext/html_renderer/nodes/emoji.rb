module Storyblok::Richtext
  module Nodes
    class Emoji < Node

      def matching
        @node['type'] === 'emoji'
      end

      def tag
        attrs = {
          'data-type' => 'emoji',
          'data-name' => @node['attrs']['name'],
          'emoji' => @node['attrs']['emoji']
        }

        [{
          tag: "span",
          attrs: attrs
        }]
      end
    end
  end
end
