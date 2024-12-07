class Api::V1::UploadsController < ApiController
  def create
    @upload = Current.user.uploads.new(upload_params)
    if @upload.save
      render :show, status: :created, location: @upload
    else
      render json: @upload.errors, status: :unprocessable_entity
    end
  end

  private

  def upload_params
    params.expect(upload: [:file])
  end
end
