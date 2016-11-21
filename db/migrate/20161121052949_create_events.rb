class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :event
      t.string :recipient
      t.string :domain
      t.string :ip
      t.string :country
      t.string :region
      t.string :city
      t.string :user_agent
      t.string :device_type
      t.string :client_type
      t.string :client_name
      t.string :client_os
      t.string :campaign_id
      t.string :campaign_name
      t.string :tag
      t.string :mailing_list
      t.datetime :timestamp
      t.string :token
      t.string :signature

      t.timestamps
    end
  end
end
