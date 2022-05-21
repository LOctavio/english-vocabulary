class PagesController < ApplicationController
  require 'faraday'
  require 'faraday/net_http'
  Faraday.default_adapter = :net_http
  def home
  end
  def meaning
    word = params[:word]
    url = "https://api.dictionaryapi.dev/api/v2/entries/en/#{word}"
    @response = Faraday.get(url)
    @response = @response.body
    @response = JSON.parse(@response)
    @response = @response[0]
  end
end
