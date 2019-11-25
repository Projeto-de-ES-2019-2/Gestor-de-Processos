class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:advogado=>:new]
  protect_from_forgery with: :exception
end
