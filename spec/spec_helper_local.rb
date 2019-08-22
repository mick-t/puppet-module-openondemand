dir = File.expand_path(File.dirname(__FILE__))
Dir["#{dir}/shared_examples/**/*.rb"].sort.each { |f| require f }

require 'rspec-puppet-facts'
include RspecPuppetFacts

add_custom_fact :service_provider, ->(_os, facts) {
  case facts[:operatingsystemmajrelease]
  when '6'
    'redhat'
  else
    'systemd'
  end
}
