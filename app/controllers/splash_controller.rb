class SplashController < ApplicationController
  def index
    @splashs = Splash.all
  end
end
