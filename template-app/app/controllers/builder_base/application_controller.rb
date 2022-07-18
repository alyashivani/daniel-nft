module BuilderBase
  class ApplicationController < ::ApplicationController
    include JSONAPI::Deserialization
    rescue_from ActiveRecord::RecordNotFound, :with => :not_found

    # def format_activerecord_errors(errors)
    #   [errors.full_messages.first]
    # end

    def format_activerecord_errors(errors)
      result = []
      errors.each do |attribute, error|
        result << { attribute => error }
      end
      result
    end

    def current_user
      AccountBlock::Account.find(@token.id)
    end

    def not_found
      render :json => {'errors' => ['Record not found']}, :status => :not_found
    end
  end
end
