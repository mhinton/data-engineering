class DataFile < ActiveRecord::Base
  has_attached_file :upload, url: "/public/uploads/:attachment_:id"
  # validates_attachment_content_type :upload, :content_type => ["application/octet-stream", "text/plain"]
  validates_attachment :upload, presence: true, content_type: { content_type: ["application/octet-stream", "text/plain"] }
  validates_attachment_file_name :upload, :matches => [/tab\Z/]
end
