class DataFilesController < ApplicationController
  def index
    @data_files = DataFile.order(:created_at).to_a
  end

  def new
    @data_file = DataFile.new
  end

  def create
    @data_file = DataFile.new(data_file_params)

    if @data_file.save
      begin
        DataImporter.new(@data_file.upload.path).process
      rescue ImportError => e
        render "new", :error => "File Import Failed: #{e.message}"
      end

      redirect_to(data_files_path, :notice => 'File Uploaded Successfully')
    else
      render "new"
    end
  end

  private
  def data_file_params
    params.require(:data_file).permit(:upload)
  end
end
