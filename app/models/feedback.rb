class Feedback < ActiveRecord::Base
  belongs_to :user

#  attr_accessor :title

#  validates_presence_of :title


  def open!
    update_column(:completed, false)
  end

  def complete!
    update_column(:completed, true)
  end
end
