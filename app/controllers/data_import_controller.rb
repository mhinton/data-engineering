class DataImportController < ApplicationController
  def index
  end

  def upload
    data_file = params['import']
    # #<ActionDispatch::Http::UploadedFile:0x007fb7f21fa2f0 @tempfile=#<Tempfile:/var/folders/b_/9k6mslj51vqfjym9ryvqpqkm0000gn/T/RackMultipart20140328-27920-w6otgy>, @original_filename="example_input.tab", @content_type="application/octet-stream", @headers="Content-Disposition: form-data; name=\"import\"; filename=\"example_input.tab\"\r\nContent-Type: application/octet-stream\r\n">
  end
end
