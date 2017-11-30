require 'httparty'
require 'json'
require_relative "roadmap.rb"

class Kele
  include HTTParty
  include Roadmap
  base_uri 'https://www.bloc.io/api/v1'

  def initialize(email,password)
    @auth = {email: email, password: password}
  end

  def auth_token
    if valid_credentials?
      response["auth_token"]
    else
      p  response["message"]
      while !valid_credentials?
        p "Enter Valid Email"
        @auth[:email] = gets.chomp
        p "Enter Valid Password"
        @auth[:password] = gets.chomp
        return self.auth_token
      end
    end
  end

  def get_mentor_availability(mentor_id)
    JSON.parse("#{self.class.get("/mentors/#{mentor_id}/student_availability", headers: { "authorization" => self.auth_token })}")
  end

  def get_me
    JSON.parse("#{self.class.get("/users/me", headers: { "authorization" => self.auth_token })}")
  end

  private

    def response
      self.class.post('/sessions', body: @auth)
    end

    def valid_credentials?
      response.code == 200 #Success Code
    end

end
