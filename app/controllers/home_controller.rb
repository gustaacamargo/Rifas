class HomeController < ApplicationController
  def index
    @tickets = current_user
                .tickets
                .includes(:raffle, :award)
  end
end
