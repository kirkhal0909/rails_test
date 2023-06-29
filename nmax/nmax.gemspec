Gem::Specification.new do |spec|
  spec.name      = 'nmax'
  spec.executables = ['nmax']
  spec.version   = '0.0.1'
  spec.platform  = Gem::Platform::RUBY
  spec.summary   = 'Nmax is gem for parsing numbers from input'
  spec.description = "Created in a tutorial found on PageKeySolutions.com/blog. Doesn't do too much!"
  spec.authors   = ['Kirill Khalevin']
  spec.email     = ['kirkhal0909@gmail.com']
  spec.homepage  = 'http://rubygems.org/gems/nmax'
  spec.license   = 'MIT'
  spec.files     = Dir.glob("{lib,bin}/**/*")
  spec.require_path = 'lib'
  spec.add_development_dependency 'rspec'
end
