module BxBlockAdminconsole
 	class ContactUsSerializer < BuilderBase::BaseSerializer
    attributes :id, :account_id, :message, :subject, :created_at, :updated_at
  end
end