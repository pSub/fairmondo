FactoryGirl.define do
  factory :direct_debit_mandate do
    association :user
  end

  factory :direct_debit_mandate_wo_user, class: DirectDebitMandate do
    reference '1001-001'
    created_at { Time.new(2016, 4, 1, 12) }
  end
end
