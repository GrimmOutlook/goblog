class PostsController < ApplicationController
  
  def index
  	@posts = Post.all
  end
 
  def show
    @post = Post.find(post_params[:id])
  end
 
  def new
    @post = Post.new
  end
 
  def create
    @post = Post.new(post_params[:post])

    if @post.save
      redirect_to posts_path, :notice => "Post was saved successfully!"
    else
      render "new"
    end
  end
 
  def edit

  end

 
  def update

  end

 
  def destroy

  end

def post_params
  params.require(:post).permit(:title, :content)
end


end
