module BxBlockAdvancedSearch
  class SearchHistory < BxBlockAdvancedSearch::ApplicationRecord
    self.table_name = :search_histories

    belongs_to :account, class_name: 'AccountBlock::Account'

    validates :search_params, presence: true, uniqueness: { scope: :account_id }
  end
end
