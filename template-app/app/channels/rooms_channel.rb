class RoomsChannel < ApplicationCable::Channel
  
  def subscribed
    conversation = AccountBlock::Account.find(params[:user])
    stream_for params[:user]
    # stream_from "rooms_channel#{current_user.id}"
  end

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  #   raise NotImplementedError
  # end
end
