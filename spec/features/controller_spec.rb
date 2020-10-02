require 'rails_helper'

RSpec.describe "Controllers", type: :request do
  it 'access new route, render new' do
    get '/users/new'
    expect(response).to render_template(:new)
  end
  it 'access create route, redirect to create' do
    post '/users', params: {user: {username: 'tadeu', email: 'tadeu@tadeu.com'}}
    expect(response).to redirect_to(root_path)
  end
  it 'access show route, render show' do
    u = User.new(username: 'tadeu', email: 'tadeu@tadeu.com')
    u.save
    get '/users/1'
    expect(response).to render_template(:show)
  end

  it 'access show, render show' do
    u1 = User.new(username: 'tadeu', email: 'tadeu@tadeu.com')
    u1.save
    e1 = Event.new(name: 'Party', location: 'Tijuana', date: '2020/10/02', hosting_user: u1)
    e1.save
    get '/events/1'
    expect(response).to redirect_to(root_path)
  end
  it 'access index, render index' do
    get '/events'
    expect(response).to redirect_to(root_path)
  end
  it 'access new, render new' do
    get '/events/new'
    expect(response).to redirect_to(root_path)
  end
  it 'access create, redirect to create' do
    post '/events', params: {events: {name: 'tadeu', location: 'tijuana', date: '2020/10/02', hosting_id: User.new}}
    expect(response).to redirect_to(root_path)
  end
  it 'access create, render new' do
    post '/events', params: {events: {name: 'tadeu', location: 'tijuana', date: '2020/10/02'}}
    expect(response).to redirect_to(root_path)
  end

  it 'access new, render new'do
    get '/invitations/new'
    expect(response).to redirect_to(root_path)
  end
  it 'access create, redirect to events path' do
    post '/invitations', params: {invitations: {invited_user_id: 1, event_id: 1}}
    expect(response).to redirect_to(root_path)
  end

end
