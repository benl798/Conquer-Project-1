class ExercisesController < ApplicationController
  def new
    @exercise = Exercise.new
  end

  def create
    @exercises = Exercise.create exercise_params
  end

  # READ ###########################################

  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
