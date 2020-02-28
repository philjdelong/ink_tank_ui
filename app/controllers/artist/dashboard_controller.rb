class Artist::DashboardController < ApplicationController

    def index
        render locals: { artist: current_user }
    end
end