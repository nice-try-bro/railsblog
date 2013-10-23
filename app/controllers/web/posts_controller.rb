class Web::PostsController < Web::ApplicationController

  unless Rails.env.test?
    http_basic_authenticate_with :name => configus.user, :password => configus.password,
                                 :except => [:index, :show]
  end

  add_breadcrumb :posts, :posts_path

  def new
    @post = Post.new

    add_breadcrumb :new_post
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id]).decorate

    add_breadcrumb @post.title
  end

  def index
    @posts = Post.published.page(params[:page]).decorate
  end

  def edit
    @post = Post.find(params[:id])

    add_breadcrumb :edit_post, @post
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :state_event, :picture, :author_id,
      :comments_attributes => [:id, :commenter, :body, :_destroy])
  end
end
