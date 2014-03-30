require 'spec_helper'

describe DataFile do
  it { should have_many(:orders) }
  it { should have_attached_file(:upload) }
  it { should validate_attachment_presence(:upload) }
  it { should validate_attachment_content_type(:upload).
                allowing('text/plain').
                rejecting('text/csv') }
  it { should validate_attachment_size(:upload).
                less_than(2.megabytes) }
end
