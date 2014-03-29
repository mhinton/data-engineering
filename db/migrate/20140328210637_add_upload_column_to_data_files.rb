class AddUploadColumnToDataFiles < ActiveRecord::Migration
  def change
    add_attachment :data_files, :upload
  end
end
