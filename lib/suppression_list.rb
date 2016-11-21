class SuppressionList < MailgunBase
  def exists?(email:)
    client.get("#{domain}/bounces/#{email}")
    true
  rescue => e
    false if /Address not found in bounces table/ =~ e.message
  end
end