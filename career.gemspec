require_relative "lib/career/version"

Gem::Specification.new do |spec|
  spec.name        = "career"
  spec.version     = Career::VERSION
  spec.authors     = ["Casey Li"]
  spec.email       = ["casey.li@itesite.ca"]
  spec.homepage    = "https://github.com/bitesite/career"
  spec.summary     = "Persistent tracking of Background jobs."
  spec.description = "Persistent tracking of Background jobs."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bitesite/career"
  spec.metadata["changelog_uri"] = "https://github.com/bitesite/career"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.3", ">= 6.1.3.1"
  spec.add_development_dependency "rspec-rails"
end
