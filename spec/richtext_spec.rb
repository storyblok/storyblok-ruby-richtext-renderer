# frozen_string_literal: true

require_relative '../lib/storyblok/richtext'

describe 'richtext' do
  it 'styled mark to add span with red class' do
    doc = {
      'type' => 'doc',
      'content' => [
        {
          'text' => 'red text',
          'type' => 'text',
          'marks' => [
            {
              'type' => 'styled',
              'attrs' => {
                'class' => 'red'
              }
            }
          ],
        },
        {
          'type' => 'paragraph',
          'content' => [
            {
              'type' => 'text',
              'marks' => [
                {
                  'type' => 'i'
                }
              ],
              'text' => 'Italic'
            }
          ]
        },
        {
          'type' => 'paragraph',
          'content' => [
            {
              'type' => 'text',
              'marks' => [
                {
                  'type' => 'em'
                }
              ],
              'text' => 'Italic too'
            }
          ]
        }
      ]
    }

    renderer = Storyblok::Richtext::HtmlRenderer.new
    expect(renderer.render(doc)).to eq('<span class="red">red text</span><p><i>Italic</i></p><p><i>Italic too</i></p>')
  end
end
