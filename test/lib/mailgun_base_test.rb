require 'test_helper'
require_relative '../../lib/mailgun_base'

class MailgunBaseTest < ActiveSupport::TestCase
  def setup
    @client = 
      MailgunBase.new(Settings.mailgun.api_key, Settings.mailgun.domain)
  end

  test 'that returns MailgunBase instance' do
    assert_kind_of MailgunBase, @client
  end
end