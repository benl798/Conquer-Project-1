class WorkoutsController < ApplicationController

  # CREATE ############################################
  def new
    @workout = Workout.new
  end

  def create
    Workout.create workout_params
    redirect_to workouts_path
  end

  # READ ################################
  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find params[:id]
  end

  # UPDATE ####################################

  def edit
    @workout = Workout.find params[:id]
  end

  def update
    workout = Workout.find params[:id]
    workout.update workout_params

    redirect_to workouts_path
  end

  # DESTROY ################################

  def destroy
    Workout.destroy params[:id]
    redirect_to workouts_path
  end

  private

  def workout_params
   params.require( :workout ).permit( :workout_type, :image, :description )
  end
end
