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

describe 'richtext' do
  it 'horizontal_rule to generate hr tag' do
    doc = {
      'type' => 'doc',
      'content' => [
        {
          'type' => 'horizontal_rule'
        }
      ]
    }

    renderer = Storyblok::Richtext::HtmlRenderer.new
    expect(renderer.render(doc)).to eq('<hr />')
  end
end

describe 'richtext' do
  it 'hard_break to generate br tag' do
    doc = {
      'type' => 'doc',
      'content' => [
        {
          'type' => 'hard_break'
        }
      ]
    }

    renderer = Storyblok::Richtext::HtmlRenderer.new
    expect(renderer.render(doc)).to eq('<br />')
  end
end

describe 'richtext' do
  it 'image to generate img tag' do
    doc = {
      'type' => 'doc',
      'content' => [
        {
          'type' => 'image',
          'attrs' => {
            'src' => 'https://asset'
          }
        }
      ]
    }

    renderer = Storyblok::Richtext::HtmlRenderer.new
    expect(renderer.render(doc)).to eq('<img src="https://asset" />')
  end
end

describe 'richtext' do
  it 'link to generate a tag' do
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
                'uuid' => '300aeadc-c82d-4529-9484-f3f8f09cf9f5'
              }
            }
          ]
        }
      ]
    }

    renderer = Storyblok::Richtext::HtmlRenderer.new
    expect(renderer.render(doc)).to eq('<a href="/link" target="_blank" uuid="300aeadc-c82d-4529-9484-f3f8f09cf9f5">link text</a>')
  end
end

describe 'richtext' do
  it 'code_block to generate a pre and code tag' do
    doc = {
      'type' => 'doc',
      'content' => [
        {
          'type' => 'code_block',
          'attrs' => {},
          'content' => [{
            'text' => 'code',
            'type' => 'text'
          }]
        }
      ]
    }

    renderer = Storyblok::Richtext::HtmlRenderer.new
    expect(renderer.render(doc)).to eq('<pre><code>code</code></pre>')
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

describe 'richtext' do
  it 'link to generate a tag with an email' do
    doc = {
      'type' => 'doc',
      'content' => [
      {
        'text' => 'an email link',
        'type' => 'text',
        'marks' => [
          {
            'type' => 'link',
            'attrs' => {
              'href' => 'email@client.com',
              'target' => '_blank',
              'uuid' => nil,
              'linktype' => 'email'
            }
          }
        ]
      }
    ]
    }

    renderer = Storyblok::Richtext::HtmlRenderer.new
    expect(renderer.render(doc)).to eq('<a href="mailto:email@client.com" target="_blank" linktype="email">an email link</a>')
  end
end

describe 'richtext' do
  it 'should render a custom attribute in a link tag' do
    doc = {
      'type' => 'paragraph',
      'content' => [
        {
          'text' => 'A nice link with custom attr',
          'type' => 'text',
          'marks' => [
            {
              'type' => 'link',
              'attrs' => {
                'href' => 'www.storyblok.com',
                'uuid' => '300aeadc-c82d-4529-9484-f3f8f09cf9f5',
                # 'anchor' => nil,
                'custom' => {
                  'rel' => 'nofollow',
                  'title' => 'nice test',
                },
                'target' => '_blank',
                'linktype' => 'url'
              }
            }
          ]
        }
      ]
    }

    renderer = Storyblok::Richtext::HtmlRenderer.new
    expect(renderer.render(doc)).to eq('<a href="www.storyblok.com" uuid="300aeadc-c82d-4529-9484-f3f8f09cf9f5" target="_blank" linktype="url" rel="nofollow" title="nice test">A nice link with custom attr</a>')
  end
end

describe 'richtext' do
  it 'should render a subscript' do
    doc = {
      'type' => 'paragraph',
      'content' => [
        {
          'text' => 'A Subscript text',
          'type' => 'text',
          'marks' => [
            {
              'type' => 'subscript'
            }
          ]
        }
      ]
    }

    renderer = Storyblok::Richtext::HtmlRenderer.new
    expect(renderer.render(doc)).to eq('<sub>A Subscript text</sub>')
  end
end

describe 'richtext' do
  it 'should render a superscript' do
    doc = {
      'type' => 'paragraph',
      'content' => [
        {
          'text' => 'A Superscript text',
          'type' => 'text',
          'marks' => [
            {
              'type' => 'superscript'
            }
          ]
        }
      ]
    }

    renderer = Storyblok::Richtext::HtmlRenderer.new
    expect(renderer.render(doc)).to eq('<sup>A Superscript text</sup>')
  end
end

describe 'richtext' do
  it 'should render a anchor in the text' do
    doc = {
      "type" => "doc",
      "content" => [
        {
          "type" => "paragraph",
          "content" => [
            {
              "text" => "Paragraph with anchor in the midle",
              "type" => "text",
              "marks" => [
                {
                  "type" => "anchor",
                  "attrs" => {
                    "id" => "test"
                  }
                }
              ]
            }
          ]
        }
      ]
    }

    renderer = Storyblok::Richtext::HtmlRenderer.new
    expect(renderer.render(doc)).to eq('<p><span id="test">Paragraph with anchor in the midle</span></p>')
  end
end

describe 'richtext' do
  it 'should render a h1 title with a anchor in the middle of the text' do
    doc = {
      'type' => 'doc',
      'content' => [
        {
          'type' => 'heading',
          'attrs' => {
            'level' => '1'
          },
          'content' => [
            {
              'text' => 'Title with ',
              'type' => 'text'
            },
            {
              'text' => 'Anchor',
              'type' => 'text',
              'marks' => [
                {
                  'type' => 'anchor',
                  'attrs' => {
                    'id' => 'test1'
                  }
                }
              ]
            },
            {
              'text' => ' in the midle',
              'type' => 'text'
            }
          ]
        }
      ]
    }

    renderer = Storyblok::Richtext::HtmlRenderer.new
    expect(renderer.render(doc)).to eq('<h1>Title with <span id="test1">Anchor</span> in the midle</h1>')
  end
end

describe 'richtext' do
  it 'should render a text with highlight color' do
    doc = {
      'type' => 'doc',
      'content' => [
        {
          'text' => 'Highlighted text',
          'type' => 'text',
          'marks' => [
            {
              'type' => 'highlight',
              'attrs' => {
                'color' => '#E72929',
              },
            },
          ],
        },
      ],
    }

    renderer = Storyblok::Richtext::HtmlRenderer.new
    expect(renderer.render(doc)).to eq('<span style="background-color:#E72929;">Highlighted text</span>')
  end
end

describe 'richtext' do
  it 'should render a text with text color' do
    doc = {
      'type' => 'doc',
      'content' => [
        {
          'text' => 'Colored text',
          'type' => 'text',
          'marks' => [
            {
              'type' => 'textStyle',
              'attrs' => {
                'color' => '#E72929',
              },
            },
          ],
        },
      ],
    }

    renderer = Storyblok::Richtext::HtmlRenderer.new
    expect(renderer.render(doc)).to eq('<span style="background-color:#E72929;">Colored text</span>')
  end
end
