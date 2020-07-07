module Storyblok::Richtext
  module Marks
    class Link < Mark

      def matching
        @node['type'] === 'link'
      end

      def tag
        attrs = @node['attrs']

        if attrs['anchor'].is_a?(String) and !attrs['anchor'].empty?
          attrs['href'] = "#{attrs['href']}##{attrs['anchor']}"
          attrs.delete('anchor')
        end

        if attrs['linktype'].is_a?(String) and attrs['linktype'] == 'email'
          emailContainer = attrs['href']
          attrs['href'] = "mailto:#{emailContainer}"
        end

        [{
          tag: "a",
          attrs: attrs
        }]
      end
    end
  end
end
