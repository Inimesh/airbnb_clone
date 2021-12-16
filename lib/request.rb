require_relative './database_connection'

class Request
  attr_reader :request_id, :availability_id, :booked, :user_id

  def initialize(request_id:, availability_id:, booked:, user_id:)
    @request_id = request_id
    @availability_id = availability_id
    @booked = booked
    @user_id = user_id
  end

  def self.add_request(availability_id:, user_id:)
    return nil if Request.duplicate?(availability_id, user_id)

    rs = DatabaseConnection.query(
      'INSERT INTO request(availability_id, user_id) VALUES ($1, $2) RETURNING request_id, availability_id, booked, user_id;', 
        [availability_id, user_id])

    Request.new(request_id: rs[0]['request_id'], availability_id: rs[0]['availability_id'], booked: rs[0]['booked'], user_id: rs[0]['user_id'])
  end

  private 
  # Prevents duplicate availability-user combos to be created i.e. a user can only book a given date for a given space ONCE
  def self.duplicate?(availability_id, user_id)
    rs = DatabaseConnection.query("SELECT EXISTS(SELECT * FROM request WHERE availability_id = $1 AND user_id = $2)", [availability_id, user_id])
    return true if rs[0]['exists'] == 't'
  end
end
