class UsersController < ApplicationController
  def new
    render "new"
  end

  def index
    render plain: User.order(:id).map { |user| user.to_pleasent_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasent_string
  end

  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    redirect_to "/"
  end

  def login
    email = params[:email]
    password = params[:password]
    user_exists = User.exists?(email: email, password: password)
    render plain: "#{user_exists}"
  end
end
