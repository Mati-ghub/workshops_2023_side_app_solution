require 'pry'

class LogsWorker
  include Sneakers::Worker

  from_queue 'basic_queue',
             exchange: 'basic_app',
             exchange_type: :direct,
             routing_key: 'book_loans'

  def work(message)
    parsed_data = JSON.parse(message)

    Log.create!(
      user_id: parsed_data['user_id'],
      data: parsed_data
    )
    ack!
  end
end


