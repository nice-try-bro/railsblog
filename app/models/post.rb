class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  validates :title, :presence => true,
                    :length => { :minimum => 5 }

  state_machine :initial => :hidden do
    event :publish do
      transition :hidden => :published
    end

    event :hide do
      transition :published => :hidden
    end
  end
end
