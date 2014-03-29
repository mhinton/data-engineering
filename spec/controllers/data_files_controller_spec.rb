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
      data_file_attributes = attributes_for(:data_file)
      post :create, data_file: data_file_attributes
      expect(response).to redirect_to(root_path)
    end
  end

end
