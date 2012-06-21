# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bonjourgem_results/version"

Gem::Specification.new do |s|
  s.name        = "bonjourgem_results"
  s.version     = BonjourgemResults::VERSION
  s.authors     = ["David Authier"]
  s.email       = ["aweaoftheworld@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Show if a gem exist on Bonjourgem.com}
  s.description = %q{What can I say more ?}

  s.rubyforge_project = "bonjourgem_results"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "nokogiri"
  s.add_runtime_dependency "slop"
  s.add_runtime_dependency "colorize"
end
