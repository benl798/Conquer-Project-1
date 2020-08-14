class UsersController < ApplicationController
  before_action :check_if_logged_in, except: [:new, :create]
  # CREATE ###########################

    # 1. Blank form
    def new
      @user = User.new
    end

    # 2. Form submit, create, redirect
    def create
      @user = User.create user_params
      # Handle upload, if file was uploaded
      if params[:file].present?
        # Actually forward uploaded file on to Cloudinary server
        response = Cloudinary::Uploader.upload params[:file]
        @user.image = response['public_id']
        @user.save
      end


      # Check whether the above create was successful i.e created a row in the users table i.e the object has an ID or if it failed due to a data validation error
      if @user.persisted?
        session[:user_id] = @user.id # log in the newly created account automatically!
        redirect_to workouts_path
      else
        # redirect_to new_user_path
        # show the form again directly, no re-direct. This lets us use the failed @user create object in our template form_for, which gives us access to the validation error messages, and also causes the already submitted fields of the form to be re-populated for the user
        render :new
      end


    end # create

    # READ #############################

    # 1. Index
    def index
      @users = User.all
    end

    # 2. Show
    def show
      @user = User.find params[:id]
    end

    # UPDATE ######################################

    # 1. Pre-filled edit form
    def edit
      @user = User.find params[:id]
    end

    # 2. Form submit, perform update, redirect to show page
    def update
      user = User.find params[:id]

      if params[:file].present?
        req = Cloudinary::Uploader.upload(params[:file])
        user.image = req["public_id"]
      end
     # We're using update_attributes here because we don't want to make a PUT request
     # (.update to update the attributes in animal_params, then .save to update the
     # image)
     user.update_attributes(user_params)
     user.save

      # Use the same strong params method we used in the create action, for this update:
      # user.update user_params

      # No template for updates; redirect to the show page (using the path helper)
      redirect_to( user_path(params[:id]) )

    end # update

    # DESTROY #######################################

    def destroy
      User.destroy params[:id]
      redirect_to root_path
    end




    private

    def user_params
     params.require( :user ).permit( :name, :email, :password, :dob, :height, :image, :sex, :weight, :target_weight, :bio, :goal, :password_confirmation )
    end


  end  # UserController
