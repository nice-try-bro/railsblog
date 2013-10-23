class Web::UsersController < Web::ApplicationController
  add_breadcrumb :authors, :users_path

  def index
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page]).decorate
  end

  def new
    @user = User.new

    add_breadcrumb :new_author
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id]).decorate

    add_breadcrumb @user.login
  end

:private

  def user_params
    params.require(:user).permit(:name, :login, :email, :password)
  end
end
