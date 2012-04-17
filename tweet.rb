#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require 'json'
require './twitter'

# Twitter OAuth Settings
open('config.json') {|f|
  @config = JSON.parse f.read
}
Twitter.configure do |config|
  config.consumer_key = @config['consumer_key']
  config.consumer_secret = @config['consumer_secret']
  config.oauth_token = @config['access_token']
  config.oauth_token_secret = @config['token_secret']
end

# Get Emacs commands
open('command-list.json') {|f|
  @command_list = JSON.parse f.read
}
index = rand(@command_list.length)
tweet = "[#{@command_list[index]['cmd']}] #{@command_list[index]['desc']}"

# Tweet via 'emacs_bot'
Twitter.update tweet



