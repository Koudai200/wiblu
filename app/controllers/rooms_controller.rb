class RoomsController < ApplicationController
  before_action :authenticate_user
  
  def create
    room = Room.create
    current_entry = Entry.create(user_id: @current_user.id, room_id: room.id)
    another_entry = Entry.create(user_id: params[:entry][:user_id], room_id: room.id)
    redirect_to room_path(room)
  end

  def index
    # ログインユーザー所属ルームID取得
    my_room_ids = @current_user.entries.pluck(:room_id)
  
    # 自分のroom_idでuser_idが自分じゃないエントリーを取得
    @another_entries = Entry.where(room_id: my_room_ids).where.not(user_id: @current_user.id)
  end
  

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.all
    @message = Message.new
    @entries = @room.entries
    @another_entry = @entries.where.not(user_id: @current_user.id).first
  end
end 