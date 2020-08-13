class CommentsController < ApplicationController
  def new
  end

  def create
    @workout = Workout.find(params[:workout_id])
        @comment = @workout.comments.create(comment_params)
        redirect_to workout_path(@workout)
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
