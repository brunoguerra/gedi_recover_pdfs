require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
ENV['ATLANTA_HOME'] = '/Users/brunoguerra/projects/atlanta_lotes/'

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
