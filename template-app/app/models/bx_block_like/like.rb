module BxBlockLike
  class Like < BxBlockLike::ApplicationRecord
    self.table_name = :likes

    belongs_to :likeable, polymorphic: true

    after_create :create_notification

    after_commit :update_virality_score

    private

    def update_virality_score
      if self.likeable_type == "BxBlockPosts::Post"
        post = BxBlockPosts::Post.find_by_id(self.likeable_id)
        return unless post.present?
        post.update(virality_score: (post.likes.count * 2 + post.comments.count * 5), recent_update: DateTime.now)
      end
    end

    def create_notification
      liked_type = likeable_type 
      account = AccountBlock::Account.find(self.like_by_id)

      BxBlockPushNotifications::PushNotification.create(
        account_id: self.like_by_id,
        push_notificable_type: liked_type,
        push_notificable_id:   likeable.id ,
        remarks: "#{account.first_name} #{account.last_name} \
                  liked your #{liked_type}"
      )
    end
  end
end