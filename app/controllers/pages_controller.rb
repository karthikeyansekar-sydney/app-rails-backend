class PagesController < ApplicationController

  before_action :check_if_logged_in, only: [:welcome]

  def welcome


  end

  def home
    check_if_logged_in
    #
  end
end
