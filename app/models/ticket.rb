class Ticket < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date, :description, :price, :time, :title, :stub
  mount_uploader :stub, StubUploader
end
