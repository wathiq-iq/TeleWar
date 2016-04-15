#Encoding: UTF-8


#require libs
require 'json'
require 'rubygems'
require 'telegram/bot'
require 'yaml/store'
require "colorize"
require 'securerandom'



#Config file
ConfigFile = File.read('config.json')
@config = JSON.parse(ConfigFile)

#Game database
db = YAML::Store.new('Game.yml')
bd = YAML::Store.new('banned.yml')
cn = YAML::Store.new('clans.yml')

#bot token
token = @config["Token"]

V = @config["Version"]

#game start
Telegram::Bot::Client.run(token) do |bot|
	puts "#{@config["BotName"]} #{V} HAS BEEN STARTED".on_red
	bot.listen do |message|
		#require bot files
		bd.transaction do
			db.transaction do
				cn.transaction do
					eval(File.read("./plugins/setting.rb"))
					eval(File.read("./plugins/levels.rb"))
					eval(File.read("./plugins/attack.rb"))
					eval(File.read("./plugins/store.rb"))
				end
			end
		end
	end
end

#TELEGRAM_BOT_POOL_SIZE=4 ruby bot.rb