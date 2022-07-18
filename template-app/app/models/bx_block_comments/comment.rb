module BxBlockComments
  class Comment < BxBlockComments::ApplicationRecord
    self.table_name = :comments

    belongs_to :account,
               class_name: 'AccountBlock::Account'

    belongs_to :post,
               class_name: 'BxBlockPosts::Post'

    has_many :likes,
              as: :likeable, class_name: 'BxBlockLike::Like', dependent: :destroy

    has_many :replies, class_name: 'BxBlockComments::Comment', foreign_key: :comment_id, dependent: :destroy

    belongs_to :commentor, class_name: 'AccountBlock::Account', foreign_key: 'account_id'

    after_save :update_virality_score

    def self.policy_class
      ::BxBlockComments::CommentPolicy
    end

    private

    def update_virality_score
      self.post.update(virality_score: (self.post.likes.count * 2 + self.post.comments.count * 5), recent_update: DateTime.now)
    end
  end
end
