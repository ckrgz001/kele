
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kele/version"

Gem::Specification.new do |s|
  s.name          = 'kele'
  s.version       = '0.0.1'
  s.date          = '2018-02-25'
  s.summary       = 'Kele API Client'
  s.description   = 'A client for the Bloc API'
  s.authors       = ['Camille Gonzales']
  s.email         = 'angrykoala@myself.com'
  s.files         = ['lib/kele.rb', 'lib/roadmap.rb']
  s.require_paths = ["lib"]
  s.homepage      =
    'http://rubygems.org/gems/kele'
  s.license       = 'MIT'
  s.add_runtime_dependency 'httparty', '~> 0.13'
  s.add_runtime_dependency 'json', '~> 1.8'
ed

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  #else
   # raise "RubyGems 2.0 or newer is required to protect against " \
    #  "public gem pushes."
  #end

  #spec.files         = `git ls-files -z`.split("\x0").reject do |f|
   # f.match(%r{^(test|spec|features)/})
  #end
  #spec.bindir        = "exe"
  #spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  #spec.require_paths = ["lib"]

  #spec.add_development_dependency "bundler", "~> 1.16"
  #spec.add_development_dependency "rake", "~> 10.0"
  #spec.add_development_dependency "rspec", "~> 3.0"
end
