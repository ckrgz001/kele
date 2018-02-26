require 'httparty'
require 'json'

module Roadmap
  include HTTParty
  base_uri "https://www.bloc.io/api/v1/"


  def get_roadmap(roadmap_id)
    response = self.class.get(api_url("roadmaps/id"), headers: { "authorization" => @auth_token })
  end

  private 
  
    def api_url(endpoint) #method to define web address as the end point
      "https://www.bloc.io/api/v1/#{endpoint}"
    end 

end