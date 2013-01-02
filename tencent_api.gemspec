# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tencent_api/version'

Gem::Specification.new do |gem|
  gem.name          = "tencent_api"
  gem.version       = TencentApi::VERSION
  gem.authors       = ["Eric Wong"]
  gem.email         = ["ericsyw@gmail.com"]
  gem.description   = %q{TencentApi is a gem for Tencent's Open platform API.}
  gem.summary       = %q{TencentApi is a gem for Tencent's Open platform API.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
