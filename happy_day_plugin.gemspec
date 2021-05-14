
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "happy_day_plugin/version"

Gem::Specification.new do |spec|
  spec.name          = "happy_day_plugin"
  spec.version       = HappyDayPlugin::VERSION
  spec.authors       = ["朱佳宝"]
  spec.email         = ["13051132827@163.com"]

  spec.summary       = %q{good day}
  spec.description   = %q{we love day}
  spec.homepage      = "https://rubygems.org"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "https://github.com"

  #   spec.metadata["homepage_uri"] = spec.homepage
  #   spec.metadata["source_code_uri"] = "https://github.com"
  #   spec.metadata["changelog_uri"] = "https://github.com"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
  #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # 
  # spec.files         = `git ls-files`.split("\n")

  spec.rubyforge_project = "happy_day_plugin"
  # # spec.files         = `git ls-files`.split("\n")
  # spec.bindir        = "bin"
  # spec.executables   = "happy_day_plugin" 
  # # spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  # spec.require_paths = ["lib"]

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  # spec.add_development_dependency "bundler", "~> 1.17"
  # spec.add_development_dependency "rake", "~> 10.0"
end
