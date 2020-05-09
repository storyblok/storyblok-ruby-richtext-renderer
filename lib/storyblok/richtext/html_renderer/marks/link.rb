module Storyblok::Richtext
  module Marks
    class Link < Mark

      def matching
        @node['type'] === 'link'
      end

      def tag
        attrs = @node['attrs']
        if attrs['anchor']
          hrefAnchor = "#{attrs['href']}##{attrs['anchor']}"
          attrs['href'] = hrefAnchor
          attrs['anchor'] = nil
        end

        [{
          tag: "a",
          attrs: attrs
        }]
      end
    end
  end
end
