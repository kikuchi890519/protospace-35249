class CommentsController < ApplicationController

  def create
    #@Prototype = Prototype.find(params[:prototype_id])
    @Comment = Comment.new(comment_params)
    
    @Prototype = @Comment.prototype
    #.new(comment_params)
    #redirect_to "/prototypes/#{@Comment.prototype.id}"  
    if @Comment.save
      redirect_to prototype_path(@Prototype.id)
    else
      render :show
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end