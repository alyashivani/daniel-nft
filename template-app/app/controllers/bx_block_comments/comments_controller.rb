module BxBlockComments
  class CommentsController < ApplicationController
    before_action :current_user
    before_action :validate_params, only: [:create]
    before_action :post_exist, only: [:create]
    before_action :load_comment, only: [:like, :dislike]

    def index
      @post = BxBlockPosts::Post.find_by_id(params[:id])
      if @post.nil?
        return render json: { errors: [{ message: 'Post does not exist.' },]}, status: :unprocessable_entity
      end
      params[:filter_param] = params[:filter_param].present? ? params[:filter_param] : "newest"
      @comments = @post.comments.where(comment_id: nil).select("comments.id, count(likes.id) as like_count").includes(:likes).references(:likes).group("likes.id, comments.id").order("like_count DESC") if params[:filter_param] == "most_relevant"
      @comments = @post.comments.where(comment_id: nil).order(created_at: :desc) if params[:filter_param] == "newest"
      @comments = @post.comments.where(comment_id: nil).order(:created_at) if params[:filter_param] == "oldest"
      render json: CommentSerializer.new(@comments, params: {current_user: current_user, filter_param: params[:filter_param]}).serializable_hash, status: :created
    end

    def create
      comment_params = jsonapi_deserialize(params)
      @comment = Comment.new(comment_params)

      authorize @comment

      @comment.account_id = current_user.id
      if @comment.save
        current_user = @comment.account
        user = @comment.post.account
        if current_user != user
          BxBlockNotifications::Notification.create(account_id: user.id, headings: "New comment on post",contents: " has commented on your post", sender_id: current_user.id, post_id: @comment.post_id)
          @notification = BxBlockNotifications::Notification.where(account_id: user.id, is_read: false).count
          user = AccountBlock::Account.find(user.id)
          RoomsChannel.broadcast_to "#{user.id}", count: @notification
  
          hsh = {}
          hsh[:instance_id] = @comment.post_id
          hsh[:title] = "New comment on post"
          hsh[:body] = "#{current_user.full_name} commented on your post"
          if user.push_post_comment_reply
            user.notify(hsh)
          end

          if user.notify_post_comment_reply
            CommentMailer
            .with(user: user, current_user: current_user, host: request.base_url)
            .comment_mailer.deliver
          end

          if user.msg_post_comment_reply
            user.post_comment(current_user)
          end
        end
        if @comment.comment_id.present?
          user1 = BxBlockComments::Comment.find(@comment.comment_id).account
          if current_user != user1
            BxBlockNotifications::Notification.create(account_id: user1.id, headings: "Reply on your comment",contents: " replied to your comment", sender_id: current_user.id, post_id: @comment.post_id)
            @notification = BxBlockNotifications::Notification.where(account_id: user1.id, is_read: false).count
            user = AccountBlock::Account.find(user1.id)
            RoomsChannel.broadcast_to "#{user1.id}", count: @notification

            hsh = {}
            hsh[:instance_id] = @comment.post_id
            hsh[:title] = "Reply on your comment"
            hsh[:body] = "#{current_user.full_name} replied to your comment"
            if user1.push_post_comment_reply
              user1.notify(hsh)
            end
            if user1.notify_post_comment_reply
              ReplyMailer
              .with(user: user1, current_user: current_user, host: request.base_url)
              .reply_mailer.deliver
            end

            if user1.push_accept_request
              user.notify(hsh)
            end

            if user1.msg_post_comment_reply
              user.comment_reply(current_user)
            end

          end
        end
        render json: CommentSerializer.new(
          @comment,
          meta: {
            message: "Comment created."
          }
        ).serializable_hash, status: :created
      else
        render json: { errors: format_activerecord_errors(@comment.errors) },
               status: :unprocessable_entity
      end
    end

    def view_replies
      @comment = BxBlockComments::Comment.find_by_id(params[:id])
      if @comment.nil?
        return render json: { errors: [{ message: 'Comment does not exist.' },]}, status: :unprocessable_entity
      end
      @comments = @comment.replies.order(created_at: :desc)
      render json: CommentSerializer.new(@comments, params: {current_user: current_user, filter_param: params[:filter_param] || "newest"}).serializable_hash, status: :created
    end

    def like
      like = @comment.likes.build(like_by_id: current_user.id)
      if like.save
        render json: CommentSerializer.new(@comment, {params: {current_user: current_user, filter_param: params[:filter_param] || "newest"}}).serializable_hash,
                status: :ok
      else
        render json: { errors: format_activerecord_errors(like.errors) },
                status: :unprocessable_entity
      end
    end

    def dislike
      like = @comment.likes.find_by(like_by_id: current_user.id)
      if like.present?
        like.destroy
        render json: CommentSerializer.new(@comment, {params: {current_user: current_user, filter_param: params[:filter_param] || "newest"}}).serializable_hash,
                status: :ok
      else
        render json: { errors: 'Record not found' },
               status: :not_found
      end
    end

    private

    def validate_params
      if params[:data].blank? || params[:data][:attributes].blank? ||
         params[:data][:attributes][:post_id].blank? || params[:data][:attributes][:comment].blank?
        return render json: {
          errors: [
            { message: 'Parameter missing.' },
          ]
        }, status: :unprocessable_entity
      end
    end

    def post_exist
      begin
        @post = BxBlockPosts::Post.find(params[:data][:attributes][:post_id])
      rescue ActiveRecord::RecordNotFound => e
        return render json: { errors: [{ message: 'Post does not exist.' },]}, status: :unprocessable_entity
      end
    end

    def format_activerecord_errors(errors)
      result = []
      errors.each do |attribute, error|
        result << { attribute => error }
      end
      result
    end

    def load_comment
      @comment = Comment.find_by(id: params[:id])
      if @comment.nil?
        render json: { message: 'Does not exist' },
               status: :not_found
      end
    end
  end
end
