require 'spec_helper'

describe API do
  it 'responds to /ping if authenticated' do
    auth_request :get, '/api/ping'
    expect(response.status).to eq(200)
  end

  it 'responds to /ping if not authenticated' do
    get '/api/ping'
    expect(response.status).to eq(401)
  end
end
