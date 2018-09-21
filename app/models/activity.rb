class Activity < ApplicationRecord
  belongs_to :actionable, polymorphic: true
  belongs_to :user

  default_scope {order(created_at: :desc)}

end
