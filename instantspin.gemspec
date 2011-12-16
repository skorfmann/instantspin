Gem::Specification.new do |s|
  s.name        = "instantspin"
  s.version     = '0.4.3'
  s.authors     = ["Jesse Storimer", "Sebastian Korfmann"]
  s.email       = ["jstorimer@gmail.com", "korfmann.sebastian@gmail.com"]
  s.homepage    = "http://jstorimer.github.com/spin"
  s.summary     = %q{Spin preloads your Rails environment to speed up your autotest(ish) workflow.}
  s.description = %q{Spin preloads your Rails environment to speed up your autotest(ish) workflow.

By preloading your Rails environment for testing you don't load the same code over and over and over... Spin works best for an autotest(ish) workflow.}

  s.executables     = ['instantspin']

  s.add_dependency  "rails-dev-boost", ">= 0.1.1"
  s.add_dependency  "growl", ">= 1.0.3"
end
