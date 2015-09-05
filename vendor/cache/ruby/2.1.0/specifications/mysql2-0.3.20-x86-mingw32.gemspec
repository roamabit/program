# -*- encoding: utf-8 -*-
# stub: mysql2 0.3.20 x86-mingw32 lib

Gem::Specification.new do |s|
  s.name = "mysql2"
  s.version = "0.3.20"
  s.platform = "x86-mingw32"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Brian Lopez"]
  s.date = "2015-08-14"
  s.email = "seniorlopez@gmail.com"
  s.homepage = "http://github.com/brianmario/mysql2"
  s.licenses = ["MIT"]
  s.post_install_message = "\n======================================================================================================\n\n  You've installed the binary version of mysql2.\n  It was built using MySQL Connector/C version 6.1.6.\n  It's recommended to use the exact same version to avoid potential issues.\n\n  At the time of building this gem, the necessary DLL files were retrieved from:\n  http://cdn.mysql.com/Downloads/Connector-C/mysql-connector-c-6.1.6-win32.zip\n\n  This gem *includes* vendor/libmysql.dll with redistribution notice in vendor/README.\n\n======================================================================================================\n\n"
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubygems_version = "2.2.3"
  s.summary = "A simple, fast Mysql library for Ruby, binding to libmysql"

  s.installed_by_version = "2.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake-compiler>, ["~> 0.9.5"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.3"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
    else
      s.add_dependency(%q<rake-compiler>, ["~> 0.9.5"])
      s.add_dependency(%q<rake>, ["~> 0.9.3"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    end
  else
    s.add_dependency(%q<rake-compiler>, ["~> 0.9.5"])
    s.add_dependency(%q<rake>, ["~> 0.9.3"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
  end
end
