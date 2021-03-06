class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.update(user: current_user, game_id: game_params[:game_id])

    @comment.save
    redirect_to @comment.game
  end

  def destroy
    @game = Game.find(params[:game_id])
    @comment = @game.comments.find(params[:id])
    @comment.destroy
    redirect_to game_path(@game)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def game_params
    params.permit(:game_id)
  end
end
