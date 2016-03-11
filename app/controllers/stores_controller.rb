require 'oauth2'

class StoresController < ApplicationController
  before_filter :authenticate_user!
  def create
    if !hasStore
      api_key = 'sk_test_xVhoYx6VW8Wf3fjraphWA9TH'
      client_id = 'pk_test_HH1uIqvBFSUKB4LaSAjp58SX'
      options = {
        :site => 'https://connect.stripe.com',
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/token'
      }
      client = OAuth2::Client.new(client_id, api_key, options)
      code = params[:code]
      resp = client.auth_code.get_token(code, :params => {:scope => 'read_write'})
      current_user.create_store(:stripeid => resp.params['stripe_user_id'], :access_token => resp.token, :publish_token => resp.params['stripe_publishable_key']);
    end
  end

end
