module Storyblok::Richtext
  module Marks
    class Link < Mark

      def matching
        @node['type'] === 'link'
      end

      def tag
        attrs = @node['attrs']

        if attrs['anchor']
          attrs['href'] = "#{attrs['href']}##{attrs['anchor']}"
        end

        [{
          tag: "a",
          attrs: attrs.slice('href', 'target')
        }]
      end
    end
  end
end
