require 'httparty'
require 'json'
require_relative 'roadmap'

class Kele
  include HTTParty
  include Roadmap

  #To retrieve the authentication token include HTTParty in Kele,
  #use  self.class.post, and pass in the sessions URL along with username and password.


  def initialize(email, password)
    response = self.class.post(api_url("sessions"), body: { email: email, password: password })
    raise 'Invalid email or password' if response.code == 404
    @auth_token = response["auth_token"]

  end

  def get_me
    response = self.class.get(api_url("users/me"), headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get(api_url("mentors/#{mentor_id}/student_availability"), headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_messages(page = 'all')
    if page == 'all'
      response = self.class.get(api_url("message_threads"), headers: { "authorization" => @auth_token })
    else
      response = self.class.get(api_url("message_threads?page=#{page}"), headers: { "authorization" => @auth_token })
    end
    JSON.parse(response.body)
  end

  def create_message(sender_email, recipient_id, stripped_text, subject)
    response = self.class.post(api_url("messages"), headers: { "authorization" => @auth_token },
    body: { sender: sender_email, recipient_id: recipient_id, stripped_text: stripped_text, subject: subject })
    response.success? puts "Message sent."
  end


  private 
  
    def api_url(endpoint) #method to define web address as the end point
      "https://www.bloc.io/api/v1/#{endpoint}"
    end 

end
