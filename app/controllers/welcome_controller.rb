# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @google_maps_url = 'https://maps.app.goo.gl/G1wySyjRyWkBEWSF7'
    @pcrf_url = 'https://pcrf1.app.neoncrm.com/campaign.jsp?campaign=14&fundraiser=1024608&'
  end
end
