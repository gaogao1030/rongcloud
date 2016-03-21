require 'spec_helper'

describe Rongcloud::Service::Chatroom do
  before(:all) do
    CONFIG = YAML.load(File.open(Rongcloud.root+ '/config.yml')).symbolize_keys
    @config = CONFIG[:rongcloud].symbolize_keys
    Rongcloud.configure do |config|
      config.app_key = @config[:app_key]
      config.app_secret = @config[:app_secret]
      config.api_host = @config[:api_host]
    end
  end

  it 'create chat room test' do
    model = Rongcloud::Service::Chatroom.new
    model.chat_room_id = 1

    expect(model.create).to eq(true)
  end

  it 'user_query' do
    model = Rongcloud::Service::Chatroom.new
    model.chat_room_id = 1
    expect(model.user_query).to eq(true)
  end
end
