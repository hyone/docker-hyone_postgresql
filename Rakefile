require 'rake'
require 'my_docker_rake/tasks'
require 'rspec/core/rake_task'
include MyDockerRake::Utilities


RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

MyDockerRake::Tasks.new do |c|
  c.containers = [
    {
      name:  'hyone.postgresql-data',
      image: 'hyone/postgresql-data',
      protect_deletion: true
    },
    {
      name:  'hyone.postgresql',
      image: 'hyone/postgresql',
      volumes_from: ['hyone.postgresql-data'],
      ports: [22, 2812, 5432]
    }
  ]

  unless c.containers.all? { |c| has_image?(c[:image]) }
    task('spec').prerequisites << 'docker:build'
  end
end
