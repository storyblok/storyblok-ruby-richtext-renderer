require File.expand_path('../lib/storyblok/richtext/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'storyblok-richtext-renderer'
  gem.version       = Storyblok::Richtext::VERSION
  gem.summary       = 'Storyblok richtext renderer'
  gem.description   = 'This is Storyblok\'s rendering service to render html from the data of the richtext field type. The renderer is compatible with Prosemirror\'s json format.'
  gem.license       = 'MIT'
  gem.authors       = ['Storyblok (Alexander Feiglstorfer)']
  gem.email         = 'it@storyblok.com'
  gem.homepage      = 'https://github.com/storyblok/storyblok-ruby-richtext-renderer'

  gem.files         = Dir['{**/}{.*,*}'].select { |path| File.file?(path) && !path.start_with?('pkg') && !path.end_with?('.gem') }
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ['lib/storyblok']

  gem.add_development_dependency 'bundler', '~> 1.5'
  gem.add_development_dependency 'rspec', '~> 3'
end
