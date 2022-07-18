module BxBlockAdminconsole
  class ContactUsController < ApplicationController
    def create
      contact = BxBlockAdminconsole::Contact.new(jsonapi_deserialize(params))
      contact.account_id = @token.id
      if contact.save
        ContactUsMailer
        .with(contact_us: contact)
        .contact_us_email.deliver
        render json: ContactUsSerializer.new(contact).serializable_hash, status: :created
      else
        render json: {errors: format_activerecord_errors(contact.errors)}, status: :unprocessable_entity
      end
    end

    private
    def format_activerecord_errors(errors)
      result = []
      errors.each do |attribute, error|
        result << { attribute => error }
      end
      result
    end
  end
end
