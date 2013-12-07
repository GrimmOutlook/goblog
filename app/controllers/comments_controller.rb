class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to post_path(@comment.post), notice: "Comment was saved successfully!"
    else
      render "new"
    end
  end

def comment_params
	params.require(:comment).permit(:author_name, :body)
end	

end
