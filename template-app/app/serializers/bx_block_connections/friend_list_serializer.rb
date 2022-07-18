module BxBlockConnections
	class FriendListSerializer < BuilderBase::BaseSerializer
	  attributes *[
	    :id,
	    :status,
	    :receipient_id,
	    :account_id,
	    :follow,
	    :first_name,
	    :last_name,
	    :image,
	    :email,
			:account_name,
			:receipient_name
	  ]

	  attribute :email do |object,params|
	    if object.receipient_id == params[:user_id]
	      user = AccountBlock::Account.find_by_id(object.account_id)
	    else
	      user = AccountBlock::Account.find_by_id(object.receipient_id)
	    end
	    if user.present?
	      user.email
	    else
	      " "
	    end
	  end

	  attribute :first_name do |object,params|
	  	if object.receipient_id == params[:user_id]
        user = AccountBlock::Account.find_by_id(object.account_id)
      else
        user = AccountBlock::Account.find_by_id(object.receipient_id)
      end
      if user.present?
        user.first_name
      end
  	end

  	attribute :last_name do |object,params|
      if object.receipient_id == params[:user_id]
        user = AccountBlock::Account.find_by_id(object.account_id)
      else
        user = AccountBlock::Account.find_by_id(object.receipient_id)
      end
      if user.present?
        user.last_name
      end
  	end

  	attribute :image do |object,params|
      if object.receipient_id == params[:user_id]
        user = AccountBlock::Account.find_by_id(object.account_id)
      else
        user = AccountBlock::Account.find_by_id(object.receipient_id)
      end
      if user.present?
        user.profile.image.image_url if (user.profile.present? && user.profile.image.present?)
      end
  	end

  	attribute :receipient_id do |object,params|
  		if object.receipient_id == params[:user_id]
  			object.account_id
  		else
  			object.receipient_id
  		end
  	end

    attribute :account_id do |object,params|
      if object.account_id == params[:user_id]
        object.account_id
      else
        object.receipient_id
      end
    end

	attribute :receipient_name do |object,params|
		if object.receipient_id == params[:user_id]
			user = AccountBlock::Account.find_by_id(object.account_id)&.user_name
		else
			user = AccountBlock::Account.find_by_id(object.receipient_id)&.user_name
		end
	end

  attribute :account_name do |object,params|
	if object.account_id == params[:user_id]
		user = AccountBlock::Account.find_by_id(object.account_id)&.user_name
	else
		user = AccountBlock::Account.find_by_id(object.receipient_id)&.user_name
	end
  end

    attribute :common_friends do |object, params|
      if object.receipient_id == params[:user_id]
        user = object.account_id
      else
        user = object.receipient_id
      end
      BxBlockConnections::Connection.mutual_friend(user, params[:user_id])
    end
	end
end