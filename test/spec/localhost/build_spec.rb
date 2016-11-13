
require 'serverspec'
require 'docker'

describe "Dockerfile#build" do

  before(:all) do
    @docker_image = Docker::Image.build_from_dir('.')
    set :backend, :docker
    set :os, family: :alpine
    set :docker_image, @docker_image.id   
  end

  describe file('/data/obfsproxy.sh') do
    it { should be_file }
    it { should be_executable } 
  end

end
