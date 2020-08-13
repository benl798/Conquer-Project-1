class WorkoutsController < ApplicationController

before_action :check_if_logged_in
  # CREATE ############################################
  def new
    @workout = Workout.new
    @exercises = Exercise.all
  end

  def create

    @workout = Workout.new workout_params

    # Handle upload, if file was uploaded
    if params[:file].present?
      # Actually forward uploaded file on to Cloudinary server
      response = Cloudinary::Uploader.upload params[:file]
      @workout.image = response['public_id']
    end

    @workout.user_id = @current_user.id

    @workout.save

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
    redirect_to exercises_path unless @workout.user == @current_user
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
