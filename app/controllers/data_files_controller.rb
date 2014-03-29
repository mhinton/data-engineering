class DataFilesController < ApplicationController
  def index
  end

  def new
    @data_file = DataFile.new
  end

  def create
    data_file = DataFile.new(data_file_params)
    raise 'hell'
  end

  private
  def data_file_params
    params.require(:data_file).permit(:upload)
  end
end
