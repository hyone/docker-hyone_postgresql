require 'spec_helper'

%w{
  postgresql-9.3
  postgresql-client-9.3
}.each do |name|
  describe package(name) do
    it { should be_installed }
  end
end

describe port(5432) do
  it { should be_listening }
end

describe command('/usr/lib/postgresql/9.3/bin/postgres --version') do
  it { should return_exit_status 0 }
  it { should return_stdout /postgres/ }
end

describe file('/etc/postgresql/9.3/main/postgresql.conf') do
  it { should be_file }
end

describe file('/etc/postgresql/9.3/main/pg_hba.conf') do
  it { should be_file }
end
