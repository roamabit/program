# -*- encoding: utf-8 -*-
# stub: gmaps4rails 2.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "gmaps4rails"
  s.version = "2.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Benjamin Roth", "David Ruyer"]
  s.date = "2015-09-05"
  s.description = "Enables easy Google map + overlays creation."
  s.email = ["apnea.diving.deep@gmail.com", "david.ruyer@gmail.com"]
  s.files = [".gitignore", ".travis.yml", "Gemfile", "Gemfile.lock", "MIT-LICENSE", "README.rdoc", "Rakefile", "gmaps4rails.gemspec", "js_compilation/gmaps_google.js", "lib/generators/gmaps4rails/copy_coffee_generator.rb", "lib/generators/gmaps4rails/copy_js_generator.rb", "lib/gmaps4rails.rb", "lib/gmaps4rails/markers_builder.rb", "lib/gmaps4rails/rails/engine.rb", "lib/gmaps4rails/rails/railtie.rb", "lib/gmaps4rails/version.rb", "script/compile_coffee_files.rb", "spec/javascripts/google/builders/marker_spec.js", "spec/javascripts/helpers/SpecHelper.js", "spec/javascripts/helpers/matchers.js", "spec/javascripts/helpers/underscore.js", "spec/javascripts/objects/handler_spec.js", "spec/javascripts/support/jasmine.yml", "spec/javascripts/support/jasmine_helper.rb", "spec/lib/base_spec.rb", "spec/lib/markers_builder_spec.rb", "spec/spec_helper.rb", "vendor/assets/javascripts/gmaps/base.coffee", "vendor/assets/javascripts/gmaps/base/base.coffee", "vendor/assets/javascripts/gmaps/google.coffee", "vendor/assets/javascripts/gmaps/google/builders/bound.coffee", "vendor/assets/javascripts/gmaps/google/builders/circle.coffee", "vendor/assets/javascripts/gmaps/google/builders/clusterer.coffee", "vendor/assets/javascripts/gmaps/google/builders/kml.coffee", "vendor/assets/javascripts/gmaps/google/builders/map.coffee", "vendor/assets/javascripts/gmaps/google/builders/marker.coffee", "vendor/assets/javascripts/gmaps/google/builders/polygon.coffee", "vendor/assets/javascripts/gmaps/google/builders/polyline.coffee", "vendor/assets/javascripts/gmaps/google/objects/bound.coffee", "vendor/assets/javascripts/gmaps/google/objects/circle.coffee", "vendor/assets/javascripts/gmaps/google/objects/clusterer.coffee", "vendor/assets/javascripts/gmaps/google/objects/common.coffee", "vendor/assets/javascripts/gmaps/google/objects/kml.coffee", "vendor/assets/javascripts/gmaps/google/objects/map.coffee", "vendor/assets/javascripts/gmaps/google/objects/marker.coffee", "vendor/assets/javascripts/gmaps/google/objects/polygon.coffee", "vendor/assets/javascripts/gmaps/google/objects/polyline.coffee", "vendor/assets/javascripts/gmaps/google/primitives.coffee", "vendor/assets/javascripts/gmaps/objects/base_builder.coffee", "vendor/assets/javascripts/gmaps/objects/builder.coffee", "vendor/assets/javascripts/gmaps/objects/handler.coffee", "vendor/assets/javascripts/gmaps/objects/null_clusterer.coffee"]
  s.homepage = "http://github.com/apneadiving/Google-Maps-for-Rails"
  s.rubygems_version = "2.2.3"
  s.summary = "Maps made easy for Ruby apps"
  s.test_files = ["spec/javascripts/google/builders/marker_spec.js", "spec/javascripts/helpers/SpecHelper.js", "spec/javascripts/helpers/matchers.js", "spec/javascripts/helpers/underscore.js", "spec/javascripts/objects/handler_spec.js", "spec/javascripts/support/jasmine.yml", "spec/javascripts/support/jasmine_helper.rb", "spec/lib/base_spec.rb", "spec/lib/markers_builder_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["= 2.14.0"])
      s.add_development_dependency(%q<rake>, ["= 10.1.0"])
      s.add_development_dependency(%q<coffee-script>, [">= 0"])
      s.add_development_dependency(%q<sprockets>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["= 2.14.0"])
      s.add_dependency(%q<rake>, ["= 10.1.0"])
      s.add_dependency(%q<coffee-script>, [">= 0"])
      s.add_dependency(%q<sprockets>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["= 2.14.0"])
    s.add_dependency(%q<rake>, ["= 10.1.0"])
    s.add_dependency(%q<coffee-script>, [">= 0"])
    s.add_dependency(%q<sprockets>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end
