class FixInvalidAccountableData < ActiveRecord::Migration[8.0]
  # Define a lightweight version of the Account model
  class Account < ActiveRecord::Base
    belongs_to :accountable, polymorphic: true
  end

  # Define a lightweight version of the Accountable module (or method) if needed
  module Accountable
    def self.from_type(type)
      # Replace this with the appropriate logic to return the correct class based on the type
      case type
        when 'Depository'
          Depository
        when 'Investment'
          Investment
        when 'CreditCard'
          CreditCard
        when 'Property'
          Property
        when 'Vehicle'
          Vehicle
        when 'Loan'
          Loan
        when 'Crypto'
          Crypto
        when 'OtherAsset'
          OtherAsset
        when 'OtherLiability'
          OtherLiability
        else
          raise "Unknown accountable type: #{type}"
      end
    end
  end

  def up
    Account.all.each do |account|
      unless account.accountable
        puts "Generating new accountable for id=#{account.id}, name=#{account.name}, type=#{account.accountable_type}"
        new_accountable = Accountable.from_type(account.accountable_type).new
        account.update!(accountable: new_accountable)
      end
    end
  end

  def down
    # Not reversible
  end
end
