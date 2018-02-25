require 'httparty'
require 'json'

class Kele
  include HTTParty
  base_uri "https://www.bloc.io/api/v1/"

  #To retrieve the authentication token include HTTParty in Kele,
  #use  self.class.post, and pass in the sessions URL along with username and password.


  def initialize(email, password)
    response = self.class.post(api_url("sessions"), body: { email: email, password: password })
    raise 'Invalid email or password' if response.code == 404
    @auth_token = response["auth_token"]

  end

  def get_me
    response = self.class.get(api_url("users/me"), headers: { "authorization" => @auth_token })
    @user = JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get(api_url("mentors/#{mentor_id}/student_availability"), headers: { "authorization" => @auth_token })
    available = []
     response.each do |timeslot|
       if timeslot["booked"] == nil
         available.push(timeslot)
       end
     end
     puts available
  end


  private 
  
    def api_url(endpoint) #method to define web address as the end point
      "https://www.bloc.io/api/v1/#{endpoint}"
    end 

end
