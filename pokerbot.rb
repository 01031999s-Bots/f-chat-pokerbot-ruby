#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'libfchat/fchat'
require 'yaml'
require './deck.rb'

class Libfchat::Fchat
  attr_accessor :deck

  # Join chatrooms on invite
  def got_CIU(message)
    #Annoyingly, the json for this varies for public and private rooms.
    #So just try both and call it a day.
    self.send('JCH',message['name'])
    self.send('JCH',message['channel'])
  end
  
  # Respond to private messages
  def got_PRI(message)
    if message['message'].downcase =~ /^!deal/
      p "Dealing cards"
      msg = @deck.draw()
      self.send('PRI',message['character'],msg)
      sleep(1)
    else
      msg = "Pokerbot 1.2 by Jammer, based off code by Jippen Faddoul ( http://github.com/Jammer2omega/fchat_pokerbot_ruby )"
      self.send('PRI',message['character'],msg)
      sleep(1)
    end
  end
  
  # Respond to messages in chatrooms
  def got_MSG(message)
    p "------"
    if message['message'].downcase =~ /^!deal/
      msg = message['character'] + ": " + @deck.draw()
      self.send('MSG',message['channel'],msg)
      sleep(1)
    end
  end
end

bot = Libfchat::Fchat.new("Pokerbot by Jammer ( http://github.com/Jammer2omega/fchat_pokerbot_ruby )","1.2")
config = YAML.load_file('pokerbot.yaml')

bot.deck = Deck.new()
bot.login(config['server'],config['username'],config['password'],config['character'])
