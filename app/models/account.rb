class Account < ActiveRecord::Base
  belongs_to :user

  validates_inclusion_of :gender, in: %w( male female N/A ), message:" The gender specified: '%{value}' is not allowed! Only values allowed are 'male','female', and 'N/A'"
  validates_inclusion_of :age, in: 20..100, message:"The age specified must be between 20 and 100"
end
