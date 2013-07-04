require 'rubygems'
require 'rspec/core/rake_task'
require 'cucumber/rake/task'

desc "Run rspec tests"
RSpec::Core::RakeTask.new(:spec)

desc "Run Cucumber tests"
Cucumber::Rake::Task.new(:cucumber) do |t|
  t.cucumber_opts = "features"
end

desc 'Default: run Rspec tests'
task :default => :spec
