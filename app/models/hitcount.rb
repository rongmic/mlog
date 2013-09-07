class Hitcount < ActiveRecord::Base
  # attr_accessible :count

  def increment_view_count
    self.update_attribute(:count, count + 1)
  end
end
