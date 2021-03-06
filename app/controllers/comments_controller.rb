class CommentsController < ApplicationController
  before_action :find_game
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
  before_action :comment_owner, only: [:destroy, :edit, :update]

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
    redirect_to game_path(@game)
  end

  def edit
  end

  def update
    if @comment.update(params[:comment].permit(:content))
      redirect_to game_path(@game)
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

  def comment_owner
    unless current_user.id == @comment.user_id
      flash[:notice] = "you shall not pass"
      redirect_to @game
    end
  end
end
