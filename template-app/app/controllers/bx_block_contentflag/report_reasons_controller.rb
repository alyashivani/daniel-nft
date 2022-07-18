module BxBlockContentflag
  class ReportReasonsController < ApplicationController
    include BuilderJsonWebToken::JsonWebTokenValidation

    before_action :validate_json_web_token

    def index
      @reasons = BxBlockContentflag::ReportReason.where(report_reason_id: nil)
      if @reasons.nil?
        return render json: { errors: [{ message: 'Report reasons are not present.' },]}, status: :unprocessable_entity
      end
      render json: ReportReasonSerializer.new(@reasons).serializable_hash, status: :created
    end
  end
end