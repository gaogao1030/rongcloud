module Rongcloud
  module Service
    class Group < Rongcloud::Service::Model
      attr_accessor :user_id
      attr_accessor :group_id
      attr_accessor :group_name
      attr_accessor :groups
      attr_accessor :users
      attr_accessor :minute
      attr_accessor :user_gag_list

      def sync
        post = {uri: Rongcloud::Service::API_URI[:GROUP_SYNC],
                params: optional_params({userId: self.user_id,
                                         group: self.groups})
        }
        res = Rongcloud::Service.req_post(post)
        res[:code]==200
      end

      def create
        post = {uri: Rongcloud::Service::API_URI[:GROUP_CREATE],
                params: optional_params({userId: self.user_id,
                                         groupId: self.group_id})
        }
        res = Rongcloud::Service.req_post(post)
        res[:code]==200
      end

      def join
        post = {uri: Rongcloud::Service::API_URI[:GROUP_JOIN],
                params: optional_params({userId: self.user_id,
                                         groupId: self.group_id})
        }
        res = Rongcloud::Service.req_post(post)
        res[:code]==200
      end

      def quit
        post = {uri: Rongcloud::Service::API_URI[:GROUP_QUIT],
                params: optional_params({userId: self.user_id,
                                         groupId: self.group_id})
        }
        res = Rongcloud::Service.req_post(post)
        res[:code]==200
      end

      def dismiss
        post = {uri: Rongcloud::Service::API_URI[:GROUP_DISMISS],
                params: optional_params({userId: self.user_id,
                                         groupId: self.group_id})
        }
        res = Rongcloud::Service.req_post(post)
        res[:code]==200
      end

      def refresh
        post = {uri: Rongcloud::Service::API_URI[:GROUP_REFRESH],
                params: optional_params({groupId: self.group_id,
                                         groupName: self.group_name})
        }
        res = Rongcloud::Service.req_post(post)
        res[:code]==200
      end

      def query
        post = {uri: Rongcloud::Service::API_URI[:GROUP_QUERY],
                params: optional_params({groupId: self.group_id})
        }
        res = Rongcloud::Service.req_post(post)
        self.users = res[:users]
        res[:code]==200
      end

      def user_gag_add
        post = {uri: Rongcloud::Service::API_URI[:GROUP_USER_GAG_ADD],
                params: optional_params({userId: self.user_id,
                                         groupId: self.group_id,
                                         minute: self.minute})
        }
        res = Rongcloud::Service.req_post(post)
        res[:code]==200
      end

      def user_gag_rollback
        post = {uri: Rongcloud::Service::API_URI[:GROUP_USER_GAG_ROLLBACK],
                params: optional_params({userId: self.user_id,
                                         groupId: self.group_id})
        }
        res = Rongcloud::Service.req_post(post)
        res[:code]==200
      end

      def get_user_gag_list
        post = {uri: Rongcloud::Service::API_URI[:GROUP_USER_GAG_LIST],
                params: optional_params({groupId: self.group_id})
        }
        res = Rongcloud::Service.req_post(post)
        self.user_gag_list = res[:users]
        res[:code]==200
      end


    end
  end
end

