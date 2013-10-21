class Post < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  has_many :comments, :dependent => :destroy
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  accepts_nested_attributes_for :comments, :reject_if => :all_blank, :allow_destroy => true

  mount_uploader :picture, PictureUploader

  state_machine :initial => :hidden do
    event :publish do
      transition :hidden => :published
    end

    event :hide do
      transition :published => :hidden
    end
  end
end
