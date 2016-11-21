class WebhookController < ApplicationController
  before_filter :is_valid_event?

  def handle_event
    return false unless ["opened", "clicked"].include?(params[:event])

    event = create_event(params)
    if event.present?
      Rails.logger.info "Successfully stored event - #{event.event} ..."
    else
      Rails.logger.error "Error!!"
    end
  end

  private

    def create_event(params)
      Event.create({
        city: params[:city],
        domain: params[:domain],
        device_type: params["device-type"],
        client_type: params["client-type"],
        region: params[:region],
        client_name: params["client-name"],
        user_agent: params["user-agent"],
        country: params[:country],
        client_os: params["client-os"],
        ip: params[:ip],
        recipient: params[:recipient],
        event: params[:event],
        timestamp: DateTime.strptime(params[:timestamp].to_s,'%s')
      })
  end
  
  def is_valid_event?
    signature = params.fetch('signature')
    api_key   = Settings.mailgun.api_key
    timestamp = params.fetch('timestamp')
    token     = params.fetch('token')
    digest    = OpenSSL::Digest.new('sha256')

    signature == OpenSSL::HMAC.hexdigest(digest,api_key, '%s%s' % [timestamp, token])
  end
end
