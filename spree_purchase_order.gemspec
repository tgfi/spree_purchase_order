# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_purchase_order'
  s.version     = '2.2.6'
  s.summary     = 'Purchase Order for Spree Commerce'
  s.description = 'This extension adds purchase orders as a payment option for Spree Commerce'
  s.required_ruby_version = '>= 2.1.2'

  s.author    = 'John King'
  s.email     = 'john@thumbtacksoftware.com'
  s.homepage  = 'http://thumbtacksoftware.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.2.6'
  s.add_dependency 'chronic', '0.10.2'
  s.add_development_dependency 'capybara', '~> 2.2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.14'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sqlite3'

end
