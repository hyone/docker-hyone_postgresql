require 'rake'
require 'my_docker_rake/tasks'
require 'rspec/core/rake_task'
include MyDockerRake::Utilities


RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

MyDockerRake::Tasks.new do |c|
  c.image = 'hyone/postgresql'
  c.container = 'postgresql'
  c.data_image = 'hyone/postgresql-data'
  c.data_container = 'postgresql-data'
  c.ports = '-p 5432'
  unless has_image?(c.image)
    task('spec').prerequisites << 'docker:build'
  end
end
