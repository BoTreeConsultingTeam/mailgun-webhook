Rails.application.routes.draw do
  
  get 'events' => "event#index" 
  post 'mailgun' => "webhook#handle_event"

end
