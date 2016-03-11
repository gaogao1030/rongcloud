module Rongcloud
  module Service
    class Chatroom < Rongcloud::Service::Model
      attr_accessor :chat_room_id
    end

    def user_query
      post = {uri: Rongcloud::Service::API_URI[:CHATROOM_USER_QUERY],
              params: optional_params({chatroomId: self.chat_room_id})
      }
      res = Rongcloud::Service.req_post(post)
      res[:code] == 20
    end

  end
end

