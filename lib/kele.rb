require 'httparty'

class Kele
  include HTTParty
  base_uri 'https://www.bloc.io/api/v1'

  def initialize(email,password)
    @auth = {email: email, password: password}
  end

  def post_response
    if valid_credentials?
      response
    else
      response["message"]
    end
  end

  def auth_token
    if valid_credentials?
      response["auth_token"]
    else
      response["message"]
    end
  end

  private

    def valid_credentials?
      self.class.post('/sessions', body: @auth).code == 200 #Success Code
    end

    def response
      self.class.post('/sessions', body: @auth)
    end

end
