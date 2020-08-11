class ExercisesController < ApplicationController

  # CREATE ############################################
  def new
    @exercise = Exercise.new
  end

  def create
    Exercise.create exercise_params
    redirect_to exercises_path
  end

  # READ ###########################################

  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find params[:id]
  end

  # UPDATE ####################################

  def edit
    @exercise = Exercise.find params[:id]
  end

  def update
    exercise = Exercise.find params[:id]
    exercise.update exercise_params

    redirect_to exercises_path
  end

  def destroy
    Exercise.destroy params[:id]
    redirect_to exercises_path
  end

  private

  def exercise_params
   params.require( :exercise ).permit( :name, :image, :descript, :link, :reps, :tips )
  end

end
