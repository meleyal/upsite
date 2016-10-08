class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan

  def expired?
    self.plan.pro? && self.ends_at < Time.now
  end
end
