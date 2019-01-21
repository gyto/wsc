# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  # Ruby magic with auth https://stackoverflow.com/questions/20875591/actioncontrollerinvalidauthenticitytoken-in-registrationscontrollercreate
  # protect_from_forgery with: :null_session

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery  with: :exception
  protect_from_forgery
  # skip_before_filter :verify_authenticity_token, if: -> { controller_name == 'sessions' && action_name == 'create' }


  layout 'base_layout'
end
