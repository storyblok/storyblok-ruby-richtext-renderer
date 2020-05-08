module Storyblok::Richtext
  module Marks
    class Link < Mark

      def matching
        @node['type'] === 'link'
      end

      def tag
        if @node['attrs'].slice('anchor')
          attrs = @node['attrs']
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
