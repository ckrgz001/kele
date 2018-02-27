require 'httparty'
require 'json'

module Roadmap
  include HTTParty

  def get_roadmap(roadmap_id)
    response = self.class.get(api_url("roadmaps/#{roadmap_id}"), headers: { "authorization" => @auth_token })
    @roadmap = JSON.parse(response.body)
  end


  def get_checkpoint(checkpoint_id)
    response = self.class.get(api_url("checkpoints/#{checkpoint_id}"), headers: { "authorization" => @auth_token })
    @checkpoint = JSON.parse(response.body)
  end

  private 
  
    def api_url(endpoint) #method to define web address as the end point
      "https://www.bloc.io/api/v1/#{endpoint}"
    end 

end