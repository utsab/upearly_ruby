class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    p "In index!!!!!!!!!!!!!!!!!!!!!!!!!!"

    @users = User.all

  end

  def new
  end

  def create
    p "*" * 50
    p "creating new user! user params: #{user_params}"
    @user = User.new(user_params)
    @user.save
    redirect_to users_path
  end

  def send_email
    p "$" * 200
    p "in send_email"
    p "$" * 200

    @x = "hurrah"
    require 'mandrill'
    m = Mandrill::API.new 'Seo6M0XjBHr738AVQ7cESA'

    message = {
     :subject=> "Whaaaaaaaaat",
     :from_name=> "peace man",
     :text=>"Woooooot",
     :to=>[
       {
         :email=> "utsab.k.saha@gmail.com",
         :name=> "Utsab"
       }
     ],
     :html=>"<html><h1>HWoot <strong>this is strong</strong>, rest of message</h1></html>",
     :from_email=>"ruby@rails.com"
    }
    sending = m.messages.send message
    p "sending: #{sending}"
    render :json => sending
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

end
