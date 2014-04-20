class Ticket < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date, :description, :price, :time, :title
end
