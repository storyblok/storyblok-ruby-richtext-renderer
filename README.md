# About

This package allows you to get an HTML string from the [richtext field](https://www.storyblok.com/docs/richtext-field) of Storyblok.

## How to install

Add the gem to your Gemfile

```ruby
gem 'storyblok-richtext-renderer'
```

## Usage

Instantiate the `Resolver` class:

```ruby
require_relative '../lib/storyblok/richtext'

renderer = Storyblok::Richtext::HtmlRenderer.new

```

Use the function `render()` to get the html string from your richtext field.

```ruby
# previous code...

doc = {
  'type' => 'doc',
  'content' => [
    {
      'type' => 'horizontal_rule'
    }
  ]
}

renderer.render(doc) # renders a html string: '<hr />'
```

### Run all tests

```bash
rspec spec/richtext_spec.rb 
```

### License

This project is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)
