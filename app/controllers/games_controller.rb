class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @user = current_user
    @game = Game.find_by(id: params[:id])
    @tags = @game.tags
    @comments = @game.comments.sort_by(&:created_at).reverse
    @comment = Comment.new

    if @user.owned_games.include?(@game)
      @owned_game = UserGame.find_by(user: current_user, game: @game)
    else
      @owned_game = UserGame.new
    end
  end
end
