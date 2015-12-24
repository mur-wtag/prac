module AuthHelper
  def auth_request(method, url, params = {}, env = {})
    http_auth =
      ActionController::HttpAuthentication::Basic.encode_credentials('test', 'password1')
    send(method, url, params, env.merge('HTTP_AUTHORIZATION' => http_auth))
  end

  def generate_access_token_for(user = nil)
    user ||= FactoryGirl.create(:user)
    application = Doorkeeper::Application.new(name: Faker::App.name, redirect_uri: 'https://app.com')
    application.owner = user
    application.save!

    access_token = Doorkeeper::AccessToken.create!(application_id: application.id, resource_owner_id: nil)
    access_token.token
  end
end
