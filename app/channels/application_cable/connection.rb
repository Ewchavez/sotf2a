# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    identified_by :destino
    def connect
      self.current_user = request.session.fetch("usuario", nil)
      reject_unauthorized_connection unless current_user

    end

  end
end
