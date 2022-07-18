module BxBlockComments
  class CommentSerializer < BuilderBase::BaseSerializer
    include FastJsonapi::ObjectSerializer
    attributes *[
        :id,
        :account_id,
        :post_id,
        :comment,
        :comment_id,
        :created_at,
        :updated_at,
        :account
    ]

    attribute :time do |object, params|
      time = BxBlockPosts::Post.post_time(object.created_at)
    end

    attribute :likes_count do |object|
      object.likes.count
    end

    attribute :is_liked do |object, params|
      object.likes.where(like_by_id: params[:current_user].id).present? if params[:current_user].present?
    end

    attribute :account do |object, params|
      acc = object.account
      image = acc.profile.image.image_url if acc.profile.present? and acc.profile.image.present?
      {id: acc.id, first_name: acc.first_name, last_name: acc.last_name, full_name: acc.full_name, image: image}
    end

    attribute :replies do |object, params|
      reply = []
      if object.replies.present?
        replies = object.replies.select("comments.id, count(likes.id) as like_count").includes(:likes).references(:likes).group("likes.id, comments.id").order("like_count DESC") if params[:filter_param] == "most_relevant"
        replies = object.replies.order(:created_at) if params[:filter_param] == "oldest"
        replies = object.replies.order(created_at: :desc) if params[:filter_param] == "newest"
        reply = BxBlockComments::ReplySerializer.new(replies, params: {current_user: params[:current_user], filter_param: params[:filter_param]})
      end
      reply
    end
  end
end
