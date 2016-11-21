require 'test_helper'
require_relative '../../lib/suppression_list'

class SupressionListTest < ActiveSupport::TestCase
  def setup
    @supression_list = 
      SuppressionList.new(Settings.mailgun.api_key, Settings.mailgun.domain)
  end

  test 'detects an email address is listed in a suppression list' do
    assert @supression_list.exists?(email: 'amit.savani@hotmail.com')
  end

  test 'detects if an email address is NOT listed in a suppression list' do
    assert_not @supression_list.exists?(email: 'amit.patel@bbotreetechnologies.com')
  end
end