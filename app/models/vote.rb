class Vote < ApplicationRecord
    belongs_to :user
    belongs_to :post

    enum operation: [ :upvote, :downvote ]

end
