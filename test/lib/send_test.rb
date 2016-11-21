require 'test_helper'
require_relative '../../lib/send'

class SendTest < ActiveSupport::TestCase
  def setup
    @client = 
      Send.new(Settings.mailgun.api_key, Settings.mailgun.domain)
  end

  test 'that sends email successfully' do
    response = 
      @client.call(from: 'amit.patel@botreetechnologies.com', 
        to: 'amit.savani@gmail.com', subject: 'Refactor', 
        text: 'The body', campaign_id: 1)
    assert_equal 'Queued. Thank you.', response.to_h['message']
  end

  test 'fails for invalid to email ' do
    exception = assert_raises Mailgun::CommunicationError do 
      @client.call(from: 'amit.patel@botreetechnologies.com', 
        to: 'amit.savani', subject: 'Refactor', 
        text: 'The body', campaign_id: 1)
    end
    assert_match /'to' parameter is not a valid address/, exception.message
  end
end