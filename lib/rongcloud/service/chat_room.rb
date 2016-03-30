module Rongcloud
  module Service
    class Chatroom < Rongcloud::Service::Model
      attr_accessor :chatroom_id
      attr_accessor :user_id
      attr_accessor :minute
      attr_accessor :user_gag_list

      def create
        post = {uri: Rongcloud::Service::API_URI[:CHATROOM_CREATE],
                params: optional_params({chatroomId: self.chatroom_id})}
        res = Rongcloud::Service.req_post(post)
        res[:code] == 200
      end

      def query
        post = {uri: Rongcloud::Service::API_URI[:CHATROOM_QUERY],
                params: optional_params({chatroomId: self.chatroom_id})}
        res = Rongcloud::Service.req_post(post)
        res[:code] == 200
      end

      def user_query
        post = {uri: Rongcloud::Service::API_URI[:CHATROOM_USER_QUERY],
                params: optional_params({chatroomId: self.chatroom_id})}
        res = Rongcloud::Service.req_post(post)
        res[:code] == 200
      end

      def user_gag_add
        post = {uri: Rongcloud::Service::API_URI[:CHATROOM_USER_GAG_ADD],
                params: optional_params({chatroomId: self.chatroom_id,userId: self.user_id,minute: self.minute})}
        res = Rongcloud::Service.req_post(post)
        res[:code] == 200
      end

      def user_gag_rollback
        post = {uri: Rongcloud::Service::API_URI[:CHATROOM_USER_GAG_ROLLBACK],
                params: optional_params({chatroomId: self.chatroom_id,userId: self.user_id})}
        res = Rongcloud::Service.req_post(post)
        res[:code] == 200
      end

      def get_user_gag_list
        post = {uri: Rongcloud::Service::API_URI[:CHATROOM_USER_GAG_LIST],
                params: optional_params({chatroomId: self.chatroom_id})}
        res = Rongcloud::Service.req_post(post)
        self.user_gag_list = res[:users]
        res[:code] == 200
      end
    end

  end
end
