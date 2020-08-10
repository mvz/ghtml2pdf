# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/manifest/task"
require "rspec/core/rake_task"
require "cucumber/rake/task"

Rake::Manifest::Task.new do |t|
  t.patterns = ["lib/**/*", "*.md", "LICENSE.txt"]
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

RSpec::Core::RakeTask.new(:spec)

task default: [:spec, :features]
