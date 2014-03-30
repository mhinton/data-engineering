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
        DataImporter.new(@data_file).process
      rescue ImportError => e
        flash[:error] = "File import failed: #{e.message}"
        return render "new"
      end

      redirect_to(revenue_data_file_path(@data_file), :notice => 'File uploaded successfully')
    else
      return render "new", :error => "File format is incorrect"
    end
  end

  def revenue
    @data_file = DataFile.find(params[:id])
    @total_revenue = RevenueCalculator.new(@data_file).total_revenue
  end

  private
  def data_file_params
    params.require(:data_file).permit(:upload)
  end
end
