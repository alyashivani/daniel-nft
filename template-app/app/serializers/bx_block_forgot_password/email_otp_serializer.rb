module BxBlockForgotPassword
  class EmailOtpSerializer < BuilderBase::BaseSerializer
  	attributes :email, :activated, :created_at, :valid_until, :pin
  end
end
