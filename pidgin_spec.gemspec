Gem::Specification.new do |s|
  s.name        = 'pidgin_spec'
  s.version     = '0.0.1'
  s.date        = '2019-11-19'
  s.summary     = "Pidgin Spec!"
  s.description = "A simple DSL for writing unit tests in Nigerian pidgin language. Pidgin is a grammatically simplified form of communication in Nigeria and other West african countries"
  s.authors     = ["Ezenwa ogbonna"]
  s.email       = 'ezenwaogbonna1@gmail.com'
  s.files       = Dir[File.join('lib', '**', '*.rb')]
  s.homepage    =
    'https://rubygems.org/gems/pidgin_spec'
  s.license       = 'MIT'
  s.add_dependency 'colorize', '~> 0.8', '>= 0.8.1'
  s.add_dependency 'rouge', '~> 3.13', '>= 3.13.0'
  s.add_dependency 'require_all', '~> 3.00'
end