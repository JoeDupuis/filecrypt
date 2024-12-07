class UploadsController < ApplicationController
  before_action :set_upload, only: %i[ show edit update destroy ]

  def index
    @uploads = Current.user.uploads.order(created_at: :desc).all
  end

  def show
  end

  def new
    @upload = Current.user.uploads.new
  end

  def edit
  end

  def create
    @upload = Current.user.uploads.new(upload_params)

    if @upload.save
      redirect_to @upload, notice: "Upload was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: "Upload was successfully updated." }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @upload.destroy!

    respond_to do |format|
      format.html { redirect_to uploads_path, status: :see_other, notice: "Upload was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_upload
      @upload = Current.user.uploads.find(params.expect(:id))
    end

    def upload_params
      params.expect(upload: [:file])
    end
end
