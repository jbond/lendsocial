Loan.seed_once(:id,
  {:id => 1, :business_id => 1, :user_id => 1, :request_date => Time.now - rand(365).days, :amount_requested => 2500, :funding_deadline => Time.now + rand(365).days, :loan_purpose_id => 1, :funded_date => Time.now, :total_committed => 1400, :description => "", :benefits => 'This is our benefits', :thank_you_message => 'And thank you!', :published_date => Time.now},
  {:id => 2, :business_id => 2, :user_id => 1, :request_date => Time.now - rand(365).days, :amount_requested => 2500, :funding_deadline => Time.now + rand(365).days, :loan_purpose_id => 1, :funded_date => Time.now, :total_committed => 1400, :description => "", :benefits => 'This is our benefits', :thank_you_message => 'And thank you!', :published_date => Time.now},
  {:id => 3, :business_id => 3, :user_id => 1, :request_date => Time.now - rand(365).days, :amount_requested => 2500, :funding_deadline => Time.now + rand(365).days, :loan_purpose_id => 1, :funded_date => Time.now, :total_committed => 1400, :description => "", :benefits => 'This is our benefits', :thank_you_message => 'And thank you!', :published_date => Time.now},
  {:id => 4, :business_id => 5, :user_id => 1, :request_date => Time.now - rand(365).days, :amount_requested => 2500, :funding_deadline => Time.now + rand(365).days, :loan_purpose_id => 1, :funded_date => Time.now, :total_committed => 1400, :description => "", :benefits => 'This is our benefits', :thank_you_message => 'And thank you!', :published_date => Time.now},
)