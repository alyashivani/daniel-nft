module BxBlockContentflag
  class ReportPostsController < ApplicationController
    include BuilderJsonWebToken::JsonWebTokenValidation

    before_action :validate_json_web_token

    def create
      post = BxBlockPosts::Post.find_by_id(report_params[:post_id])
      report_reason = BxBlockContentflag::ReportReason.find_by_id(report_params[:report_reason_id])
      if post.account_id == current_user.id 
        render json: {errors: "You can't report your own post."}, status: :unprocessable_entity
      else
        report_post = current_user.report_posts.find_or_initialize_by(post_id: post.id, report_reason_id: report_reason.id)
        if report_post.save
          render json: {message: "Post is reported successfully."}, status: :ok
        else
          render json: {errors: format_activerecord_errors(report_post.errors)}, status: :unprocessable_entity
        end
      end
    end

    private

    def report_params
      params.require(:report_post).permit(:post_id, :report_reason_id)
    end

  end
end