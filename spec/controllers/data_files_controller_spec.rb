require 'spec_helper'

describe DataFilesController do

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(assigns: :data_files)
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns a new data_file" do
      get :new
      expect(assigns :data_file).to be_a_new(DataFile)
    end
  end

  describe "POST 'create'" do
    it "creates a new DataFile" do
      data_file_attributes = attributes_for(:good_data_file)
      expect {
        post :create, data_file: data_file_attributes
      }.to change(DataFile, :count).by 1
    end

    it "redirects to the revenue page" do
      data_file_attributes = attributes_for(:good_data_file)
      post :create, data_file: data_file_attributes
      @data_file = DataFile.last
      expect(response).to redirect_to(revenue_data_file_path(@data_file))
    end

    it "renders 'new' for a bad data file" do
      data_file_attributes = attributes_for(:bad_data_file)
      post :create, data_file: data_file_attributes
      expect(response).to render_template :new
    end
  end

end
