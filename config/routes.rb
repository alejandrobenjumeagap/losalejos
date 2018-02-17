Rails.application.routes.draw do

  scope :invites do
    get '/token/:token'                                     => 'invites#get_details'
    patch '/token/:token/user/:user_id'                     => 'invites#update_user'
  end

end
