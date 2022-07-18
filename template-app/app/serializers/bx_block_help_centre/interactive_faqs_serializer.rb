module BxBlockHelpCentre
  class InteractiveFaqsSerializer < BuilderBase::BaseSerializer
    include FastJsonapi::ObjectSerializer
    attributes *[
        :id,
        :question,
        :answer,
        :created_at,
        :updated_at
    ]
  end
end
