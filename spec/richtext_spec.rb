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

describe 'richtext' do
  it 'anchor links test' do
    doc = {
      'type' => 'doc',
      'content' => [
      {
        'text' => 'link text',
        'type' => 'text',
        'marks' => [
          {
            'type' => 'link',
            'attrs' => {
              'href' => '/link',
              'target' => '_blank',
              'uuid' => '300aeadc-c82d-4529-9484-f3f8f09cf9f5',
              'anchor' => 'anchor-text'
            }
          }
        ]
      }
    ]
    }

    renderer = Storyblok::Richtext::HtmlRenderer.new
    expect(renderer.render(doc)).to eq('<a href="/link#anchor-text" target="_blank" uuid="300aeadc-c82d-4529-9484-f3f8f09cf9f5">link text</a>')
  end
end
