# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel

  def subscribed
    stream_from 'room_channel'

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end



  def speak(data)

    a= :usuario
    currenU=Usuario.find_by(codigo:current_user)

    Message.create! content: data['message'] ,origen: currenU.id

  end
end
