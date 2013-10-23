class Web::UsersController < Web::ApplicationController
  add_breadcrumb :authors, :users_path

  def index
    @q = User.ransack(params[:q])
    @paging_attrs = {} || configus.paging.user.attrs.to_hash
    users = @q.result.page(params[:page]).per(configus.paging.user.per_page)
    @users = users.decorate
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
