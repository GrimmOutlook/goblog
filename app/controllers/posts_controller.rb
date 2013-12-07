class PostsController < ApplicationController
  
  def index
  	@posts = Post.all(order: 'created_at DESC')
  end
 
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comment.post_id = @post.id
  end
 
  def new
    @post = Post.new
  end
 
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: "Post was saved successfully!"
    else
      render "new"
    end
  end
 
  def edit
    @post = Post.find(params[:id])
  end
 
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to posts_path, notice: "Post was updated & saved successfully!"
    else
      render "edit"
    end
  end
 
  def destroy
    @post = Post.find(params[:id])
    @post.destroy    
    redirect_to posts_path, notice: "Post was deleted - it is gone!"    
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
