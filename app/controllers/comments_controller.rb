class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
        redirect_to prototype_path(@comment.prototype)
    end
 # views/tweets/show.html.erbのファイルを参照しています。
  end

def destroy
end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end