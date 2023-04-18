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

        if attrs['custom'].is_a?(Hash)
          for item in attrs['custom'] do
            attrs[item[0]] = item[1]
          end
          attrs.delete('custom')
        end

        [{
          tag: "a",
          attrs: attrs
        }]
      end
    end
  end
end
