class PasswordResetsController < ApplicationController

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    @user&.deliver_reset_password_instructions!
    flash[:notice] = "パスワードリセット手順を送信しました"
    redirect_to("/")
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)
    not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)
    return not_authenticated if @user.blank?
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      flash[:success] = "パスワードを変更しました"
    else
      flash.now[:danger] = "パスワード変更に失敗しました"
      render :edit
    end
  end

 end