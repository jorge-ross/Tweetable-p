class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, counter_cache: true

  validates :user, uniqueness: { scope: :tweet }
end
