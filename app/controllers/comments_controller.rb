class CommentsController < ApplicationController
  before_action :find_game
  def create
    @comment = @game.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end

private

  def find_game
    @game = Game.find(params[:game_id])
  end

end
