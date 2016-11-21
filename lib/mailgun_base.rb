class MailgunBase
  attr_reader :client, :domain

  def initialize(key, domain)
    @client = Mailgun::Client.new(key)
    @domain = domain
  end
end
