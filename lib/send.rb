class Send < MailgunBase
  def call(from:, to:, subject:, text:, campaign_id:)
    message_params =  { 
                        from: from,
                        to:   to,
                        subject: subject,
                        text: text,
                        'o:campaign' => campaign_id
                      }  
    client.send_message domain, message_params
  end
end