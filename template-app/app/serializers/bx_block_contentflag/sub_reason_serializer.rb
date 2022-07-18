module BxBlockContentflag
  class SubReasonSerializer < BuilderBase::BaseSerializer
    include FastJsonapi::ObjectSerializer
    attributes *[
        :id,
        :content,
        :report_reason_id,
        :created_at,
        :updated_at
    ]

    attribute :sub_reasons do |object|
      sub_reasons = []
      object.sub_reasons.each do |reason|
        sub_reasons << SubReasonSerializer.new(reason)
      end
      sub_reasons
    end
  end
end
