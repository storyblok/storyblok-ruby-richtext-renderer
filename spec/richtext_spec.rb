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
          ]
        }
      ]
    }

    renderer = Storyblok::Richtext::HtmlRenderer.new
    expect(renderer.render(doc)).to eq('<span class="red">red text</span>')
  end
end
