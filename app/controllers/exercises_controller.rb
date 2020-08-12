class ExercisesController < ApplicationController

before_action :check_if_logged_in, except: [ :index, :show ]

  # CREATE ############################################
  def new
    @exercise = Exercise.new
  end

  def create

    @exercise = Exercise.new exercise_params

    # Handle upload, if file was uploaded
    if params[:file].present?
      # Actually forward uploaded file on to Cloudinary server
      response = Cloudinary::Uploader.upload params[:file]
      @exercise.image = response['public_id']
    end

    @exercise.user_id = @current_user.id

    @exercise.save

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
    redirect_to exercises_path unless @exercise.user == @current_user
  end

  def update
    exercise = Exercise.find params[:id]

    if exercise.user != @current_user
      redirect_to exercises_path
      return
    end

    exercise.update exercise_params

    redirect_to exercises_path
  end

  # DESTROY ################################

  def destroy
    Exercise.destroy params[:id]
    redirect_to exercises_path
  end

  private

  def exercise_params
   params.require( :exercise ).permit( :name, :image, :descript, :link, :reps, :tips )
  end

end
