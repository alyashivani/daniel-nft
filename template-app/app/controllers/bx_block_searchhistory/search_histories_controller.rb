module BxBlockSearchhistory
  class SearchHistoriesController < BuilderBase::ApplicationController
    include BuilderJsonWebToken::JsonWebTokenValidation

    before_action :validate_json_web_token

    def destroy
      search_history = current_user.search_histories.find_by_id(params[:id])
      if search_history.destroy
        render json: {message: "Search history deleted succesfully!"}
      else
        render json: {errors: format_activerecord_errors(search_history.errors)}, status: :unprocessable_entity
      end
    end
  end
end
