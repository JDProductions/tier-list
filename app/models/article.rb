class Article < ActiveRecord::Base

  belongs_to :user
  validates :title, presence: true, :length => { :minimum => 2 }
  validates :description, presence: true, :length => { :minimum => 10 }
  validates :user_id, presence: true


end