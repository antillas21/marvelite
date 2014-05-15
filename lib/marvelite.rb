require 'digest/md5'
require 'httparty'
require 'hashie'

require "marvelite/version"
require "marvelite/api/router"
require "marvelite/api/client"
require "marvelite/api/response"

module Marvelite
  def self.router(attrs = {})
    Marvelite::API::Router.new(attrs)
  end
end