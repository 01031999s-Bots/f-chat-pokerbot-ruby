#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-
 
require 'libfchat/fchat'
require 'yaml'
require './deck.rb'
 
class Pokerbot < Libfchat::Fchat
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
     elsif message['message'].downcase =~ /^!kissme/
      msg = "/me grabs you and pulls you into a deep kiss"
      self.send('PRI',message['character'],msg)
      sleep(1)
    else
      msg = "Pokerbot 1.1 by Jippen Faddoul ( http://github.com/jippen/fchat_pokerbot_ruby )"
      self.send('PRI',message['character'],msg)
sleep(1)
    end
  end
 
  # Respond to messages in chatrooms
  def got_MSG(message)
    p "------"
if message['message'].downcase =~ /^!slap (.*)?/i
msglist = message['message'].split(/slap (.*)?/i)
msg = "/me slaps " + msglist[1] + " around a bit with a large penis."
self.send('MSG',message['channel'],msg)
elsif message['message'].downcase =~ /^!fuck (.*)?/i
msglist = message['message'].split(/fuck (.*)?/i)
msg = "/me grabs " + msglist[1] + " and tears off his/her pants and boxers/panties, sliding a my dick in their asshole!"
self.send('MSG',message['channel'],msg)
elsif message['message'].downcase =~ /^!fuckgirl (.*)?/i
msglist = message['message'].split(/fuckgirl (.*)?/i)
msg = "/me grabs " + msglist[1] + " and tears off her pants(or)skirt and panties, sliding my dick in her pussy"
self.send('MSG',message['channel'],msg)
elsif message['message'].downcase =~ /^!deepthroat (.*)?/i
msglist = message['message'].split(/deepthroat (.*)?/i)
msg = message['character'] + " tears off his pants and grabs " + msglist[1] + " asking him/her to suck his penis."
self.send('MSG',message['channel'],msg)
   elsif message['message'].downcase =~ /^!deal/
      msg = message['character'] + ": " + @deck.draw()
      self.send('MSG',message['channel'],msg)
      sleep(1)
    elsif message['message'].downcase =~ /^!kissme/
         msg = "/me grabs " + message['character'] + " and pulls " +message['character'] + " into a deep kiss"
          self.send('MSG',message['channel'],msg)
    elsif message['message'].downcase =~ /^!draw1/
          msg = message['character'] + ": " + @deck.draw1()
          self.send('MSG',message['channel'],msg)
    elsif message['message'].downcase =~ /^!draw2/
          msg = message['character'] + ": " + @deck.draw2()
          self.send('MSG',message['channel'],msg)
    elsif message['message'].downcase =~ /^!draw3/
          msg = message['character'] + ": " + @deck.draw3()
          self.send('MSG',message['channel'],msg)
    elsif message['message'].downcase =~ /^!rules/
      msg = "For drawing purposes- !deal
 
           Try to use your grammar and literacy. No kik su-n-us or ur turn.
 
           Have fun! This is a game meant to have fun! So try to show your teasing side a bit, okay? Unless you don't have fun doing that. Then... just show us something!
 
           Also, please be courteous and if your intentions are more than just teasing or flirting, take it to another room so as to not interrupt the flow of the game too much!
 
           Rule 1) Five pieces of clothing at a minimum. There is no SET maximum, but it's recommended not to go over eight pieces. One accessory is allowed per person.
 
           Rule 2) Once the dealer calls the winning hand (PLEASE refrain from calling it before the dealer! Help is appreciated in PMs, but it's confusing on occasion when someone other than the dealer calls the hands!) the person who wins picks one person to remove one piece of clothing.
 
           Rule 3) If it is the last piece of the person called, the one who called it removes it themselves. The naked person is then removed from play, to either sit on the lap of the person who called them.
 
           Rule 4) The game continues until one person is left clothed. Good luck, and have fun.
           -------------
           Other commands
           --------------
           --------------
          !mms-softly fire m&ms randomly
          !rules-Displays this message.
          !draw1-Draws 1 card.
          !draw2-Draws 2 cards.
          !draw3-Draws 3 cards."
      self.send('MSG',message['channel'],msg)
    elsif message['message'].downcase =~ /^!desc/
      msg = "Welcome to Ygvarland! Where the lolis are willing, or perhaps 'not'for those forcing types, and the pervy pulsing phalluses are always able and at attention! Not into Loli's? That's okay, there's usually plenty of grown girls as well. However, don't force yourself on to the unwilling.

Come on in, make yourself at home, the rules are quite simple:

Be respectful (unless of course it's part of the kinky fun, hehe. This includes: not criticizing literacy, gender, race, species, orientation or kinks, and definitely no forcing beliefs on others.) 
No means no, unless it doesn't mean no, in which case you'll ...know...
If you're a naughty star or starlet please feel free to show off your skills in the main room, we love exhibitionists here!
Private fun is of course also acceptable, though the public play is always ALWAYS welcome so all can share in the fun.

Other than these guidelines have fun, this is a free range arena and anything else goes, however if someone does end up having a problem with it, please respect that if it is a shared feeling by others. We don't want to chase anyone off, do we?

Above all else we just want you to have fun and get naughty... so bring your friends, your family, your slaves, pets, masters, and don't forget the whips, chains, swings, and toys! (if you're into that sort of stuff)

Ygvarland: Where anything can happen and your fantasies might just become a little more of reality.

Owner: [user]Lotte_Ygvar[/user] Lotte

Mods: [user]Dadson Brothers[/user] Dadson [user]Fang Swiftwing[/user] Fang [user]SSS[/user] SSS [user]Ezomori Nozomu[/user] Nozomu

Workers: [user]Minamoto_Chizuru[/user] Chizuru"
self.send('MSG',message['channel'],msg)
elsif message['message'].downcase =~ /^!fuckme/
msg = "/me grabs " + message['character'] + " and tears off her pants(or)skirt and panties, sliding my dick in her pussy"
self.send('MSG',message['channel'],msg)
# Fix
elsif message['message'].downcase =~ /^!kiss (.*)?/i
msglist = message['message'].split(/kiss (.*)?/i)
         msg = message['character'] + " grabs " + msglist[1] + " and pulls  " + msglist[1] + " into a deep kiss"
          self.send('MSG',message['channel'],msg)
elsif message['message'].downcase =~ /^!mms (.*)?/i
msglist = message['message'].split(/mms (.*)?/i)
msg = "/me turns into a giant M&M cannon and launches a giant M&M at " + msglist[1] + "  knocking  "  + msglist[1] + " out and covering " + msglist[1] + " in chocolate!"
self.send('MSG',message['channel'],msg)
if message['message'].downcase =~ /^!slap (.*)?/i
msglist = message['message'].split(/slap (.*)?/i)
msg = "/me slaps " + msglist[1] + " around a bit with a large penis."
self.send('MSG',message['channel'],msg)
elsif message['message'].downcase =~ /^!fuck (.*)?/i
msglist = message['message'].split(/fuck (.*)?/i)
msg = "/me grabs " + msglist[1] + " and tears off his/her pants and boxers/panties, sliding a my dick in their asshole!"
self.send('MSG',message['channel'],msg)
elsif message['message'].downcase =~ /^!fuckgirl (.*)?/i
msglist = message['message'].split(/fuckgirl (.*)?/i)
msg = "/me grabs " + msglist[1] + " and tears off her pants(or)skirt and panties, sliding my dick in her pussy"
self.send('MSG',message['channel'],msg)
elsif message['message'].downcase =~ /^!deepthroat (.*)?/i
msglist = message['message'].split(/deepthroat (.*)?/i)
msg = message['character'] + " tears off his pants and grabs " + msglist[1] + " asking him/her to suck his penis."
self.send('MSG',message['channel'],msg)
end
    end
  end
end