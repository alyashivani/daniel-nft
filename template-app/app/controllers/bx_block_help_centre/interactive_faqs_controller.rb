module BxBlockHelpCentre
  class InteractiveFaqsController < ApplicationController
    before_action :get_question_answer, only: [:show, :update, :destroy]

    def index
      @faqs = BxBlockHelpCentre::InteractiveFaq.all.order('created_at DESC')
      if @faqs.present?
        render json: InteractiveFaqsSerializer.new(
          @faqs, meta: { message: 'List of frequently asked questions.' }
        ).serializable_hash, status: :ok
      else
        render json: {
          errors: [ { message: 'No data found.' },]
        }, status: :unprocessable_entity
      end
    end 
  end
end
