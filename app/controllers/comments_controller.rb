class CommentsController < ApplicationController
  before_action :find_game
  before_action :find_comment, only: [:destroy, :edit, :update]
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

  def destroy
    @comment.destroy
    redirect_to games_path(@game)
  end

  def edit
  end

  def update
    if @comment.update(params[:comment].permit(:content))
      redirect_to game_path(@post)
    else
      render 'edit'
    end
  end

  private

  def find_game
    @game = Game.find(params[:game_id])
  end

  def find_comment
    @comment = @game.comments.find(params[:id])
  end
end
