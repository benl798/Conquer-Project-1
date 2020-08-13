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

    if @workout.persisted?

      #because the workout was successfully saved, we can now add the selected exercises as associations
      @workout.exercises << Exercise.find( params[:exercises] )
      if params[:exercise_name].present?
        # If the user has filled out the exercise part of the form, create that new exercise and associate it with this new workout
        exercise = Exercise.create name: params[:exercise_name], reps: params[:exercise_reps], descript: params[:exercise_descript], image: params[:exercise_image], link: params[:exercise_link], tips: params[:exercise_tips]
        @workout.exercises << exercise
      end
      redirect_to workouts_path
    else
      # redirect_to new_user_path
      # show the form again directly, no re-direct. This lets us use the failed @user create object in our template form_for, which gives us access to the validation error messages, and also causes the already submitted fields of the form to be re-populated for the user
      @exercises = Exercise.all
      render :new
    end




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
    @exercises = Exercise.all
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
