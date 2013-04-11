# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'janky-flowdock/version'

Gem::Specification.new do |gem|
  gem.name          = "janky-flowdock"
  gem.version       = Janky::ChatService::Flowdock::VERSION
  gem.authors       = ["Stratos Voukelatos"]
  gem.email         = ["stratosvoukel@gmail.com"]
  gem.description   = %q{Flowdock inbox adapter for Janky}
  gem.summary       = %q{Flowdock adapter for Janky}
  gem.homepage      = ""

  gem.add_dependency 'flowdock'
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
