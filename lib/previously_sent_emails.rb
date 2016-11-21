class PreviouslySentEmails < MailgunBase
  def get(email:)
    client.get("#{domain}/events", { event: 'delivered', to: email })
  end
end
