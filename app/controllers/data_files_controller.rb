class DataFilesController < ApplicationController
  def index
    @data_files = DataFile.order(:created_at).to_a
  end

  def new
    @data_file = DataFile.new
  end

  def create
    data_file = DataFile.create(data_file_params)

    respond_to do |format|
      format.html {
        redirect_to(data_files_path, :notice => 'File uploaded successfully')
      }
    end
  end

  private
  def data_file_params
    params.require(:data_file).permit(:upload)
  end
end
