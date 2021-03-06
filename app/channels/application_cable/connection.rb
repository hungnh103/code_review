module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_user
    end

    protected

    def find_user
      # TODO: check reviewer
      user_id = cookies.encrypted[:user_id]
      user_id || reject_unauthorized_connection

      user = User.find_by id: user_id
      user || reject_unauthorized_connection
    end
  end
end
