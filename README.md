# About

This is Storyblok's rendering service to render html from the data of the richtext field type. The renderer is also compatible with Prosemirror's json format.

## How to install

Add the gem to your Gemfile

```ruby
gem 'storyblok-richtext-renderer'
```

### Rendering a richtext field

```ruby
require 'storyblok/richtext'
renderer = Storyblok::Richtext::HtmlRenderer.new
renderer.render({'type' => 'doc', 'content' => [{'type' => 'paragraph', 'content' => [{'text' => 'Good', 'type' => 'text'}]}]})
# -> <p>Good</p>
```

### Run all tests

```bash
rspec spec/richtext_spec.rb 
```

### License

This project is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)
