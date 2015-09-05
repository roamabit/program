# -*- encoding: utf-8 -*-
# stub: acts_as_commentable_with_threading 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "acts_as_commentable_with_threading"
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Evan Light", "Jack Dempsey", "Xelipe", "xxx"]
  s.date = "2014-09-15"
  s.description = "Polymorphic threaded comments Rails gem for Rails 4+"
  s.email = "evan@tripledogdare.net"
  s.homepage = "http://github.com/elight/acts_as_commentable_with_threading"
  s.rubygems_version = "2.2.3"
  s.summary = "Polymorphic comments Rails gem - Rails 4+ only"

  s.installed_by_version = "2.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 3.0"])
      s.add_development_dependency(%q<rails>, [">= 4.0"])
      s.add_runtime_dependency(%q<activerecord>, [">= 4.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 4.0"])
      s.add_runtime_dependency(%q<awesome_nested_set>, [">= 3.0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 3.0"])
      s.add_dependency(%q<rails>, [">= 4.0"])
      s.add_dependency(%q<activerecord>, [">= 4.0"])
      s.add_dependency(%q<activesupport>, [">= 4.0"])
      s.add_dependency(%q<awesome_nested_set>, [">= 3.0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 3.0"])
    s.add_dependency(%q<rails>, [">= 4.0"])
    s.add_dependency(%q<activerecord>, [">= 4.0"])
    s.add_dependency(%q<activesupport>, [">= 4.0"])
    s.add_dependency(%q<awesome_nested_set>, [">= 3.0"])
  end
end
