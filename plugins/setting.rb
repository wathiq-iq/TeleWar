#Encoding: UTF-8

if @config["Devlopers"].include?(message.from.id)
	case message.text
	when "#add"
		@config["Groups"].insert(0,message.chat.id)
		bot.api.send_message(chat_id: message.chat.id, text: "This group has been added" )
	when "#prom"
		@config["Admins"].insert(0,message.reply_to_message.from.id)
		bot.api.send_message(chat_id: message.chat.id, text: "#{message.reply_to_message.from.first_name} #{message.reply_to_message.from.last_name} has been promoted" )
	when "#remove"
		@config["Groups"].delete(message.chat.id)
		bot.api.send_message(chat_id: message.chat.id, text: "this group has been removed" )
	when "#dem"
		@config["Admins"].delete(message.reply_to_message.from.id)
		bot.api.send_message(chat_id: message.chat.id, text: "#{message.reply_to_message.from.first_name} #{message.reply_to_message.from.last_name} has been disqualified" )
	end
end
if @config["Admins"].include?(message.from.id)
	case message.text
	when "#about"
		bot.api.send_message(chat_id: message.chat.id, text: "⚔TELEWAR #{V}⚔\nBy @Eyeslov\nThanks to :\n@Hirokai for the bot design improvements\n@WhiteFromInsideNiggaFromOut & @Mic_key for helping bug fixes\n@Haru_kun for ideas.\n and special thanks to @hussainho10 & @UnkownOtaku & @Abdullah_kready for watching :)" )
	when "#how"
		bot.api.send_message(chat_id: message.chat.id, text: "⚔TELEWAR #{V}⚔ is a multiplayer telegram chat game." )
	end
	if message.text == "#id" 
		bot.api.send_message(chat_id: message.chat.id, text: message.chat.id, reply_to_message: message.message_id)
	elsif message.text == "#ids" && message.reply_to_message
		bot.api.send_message(chat_id: message.chat.id, text: message.reply_to_message.from.id )
	elsif message.text == "#bban" && message.reply_to_message && !@config["Devlopers"].include?(message.reply_to_message.from.id)
		bd[message.reply_to_message.from.id] = message.reply_to_message.from.id
		bot.api.send_message(chat_id: message.chat.id, text: "#{message.reply_to_message.from.username} has been permanently blocked from the game" )
	elsif message.text == "#ban" && message.reply_to_message && !@config["Devlopers"].include?(message.reply_to_message.from.id)
		@config["bban"].insert(0,message.reply_to_message.from.id)
		bot.api.send_message(chat_id: message.chat.id, text: "#{message.reply_to_message.from.username} has been blocked from the game" )
	elsif message.text == "#unban" && message.reply_to_message && !@config["Devlopers"].include?(message.reply_to_message.from.id)
		@config["bban"].delete(message.reply_to_message.from.id)
		bot.api.send_message(chat_id: message.chat.id, text: "#{message.reply_to_message.from.username} has been unblocked" )
	end
end
if  !bd[message.from.id] && !@config["bban"].include?(message.from.id)
	case message.text
	when "#login"
		if db[message.from.id]
		    bot.api.send_message(chat_id: message.chat.id, text: "You're Already Registered!" )
	    else
		    db[message.from.id] = {"Power"=>150,
		    	"Defanse"=>100,
		    	"res"=>600,
		    	"Gems"=>60,
		    	"Attacks"=>0,
		    	"Wins"=>0,
		    	"Loses"=>0,
		    	"Defanse_a"=>0,
		    	"dd_win"=>0,
		    	"dd_loses"=>0,
		    	"level"=>1,
		    	"Shield"=>false,
		    	"clan"=>"none"
		    }
		    bot.api.send_message(chat_id: message.chat.id, text: "You've been Registered!" )
		    puts "#{message.from.username} HAS BEEN SIGNED UP".on_green
		end
	when "#info"
		if db[message.from.id]
	    	bot.api.send_message(chat_id: message.chat.id, text: "👾 Player: #{message.from.first_name} #{message.from.last_name}\n💠 Clan: #{db[message.from.id]["clan"]}\n🏅 Level: #{db[message.from.id]["level"]}\n💪 Power: #{db[message.from.id]["Power"]}\n🕸 Defense: #{db[message.from.id]["Defanse"]}\n🍎 Resources: #{db[message.from.id]["res"]}\n💎  Gems: #{db[message.from.id]["Gems"]}\n🔰 Shield: #{db[message.from.id]["Shield"]}\n⚔ Number of Attacks: #{db[message.from.id]["Attacks"]}\n👍--Wins: #{db[message.from.id]["Wins"]}\n👎--Losses: #{db[message.from.id]["Loses"]}\n🎯 Number of Defenses: #{db[message.from.id]["Defanse_a"]}\n👍--Wins: #{db[message.from.id]["dd_win"]}\n👎--Losses: #{db[message.from.id]["dd_loses"]}\n " )
	    else
		    bot.api.send_message(chat_id: message.chat.id, text: "You're not registered in the game." )
		end
	when "#shop"
		bot.api.send_message(chat_id: message.chat.id, text: "💲💲💲Shop💲💲💲\nfor buying send :\nBuy [pow,def,res] [1,2,3]\n》💪 Power Points\n1 -   50💪 for 10💎\n2 - 100💪 for 15💎\n3 - 250💪 for 30💎\n》🕸 Defense Points\n1 -  50 🕸 for 10 💎\n2 - 100🕸 for 15 💎\n3 - 250🕸 for 30 💎\n》🍎 Resources\n1 -   300🍎 for 15💎\n2 -   600🍎 for 25💎\n3 - 1400🍎 for 35💎" )
	end

	if message.text == "info" && db[message.from.id] && message.reply_to_message && db[message.reply_to_message.from.id]
		bot.api.send_message(chat_id: message.chat.id, text: "👾 Player: #{message.reply_to_message.from.first_name} #{message.reply_to_message.from.last_name}\n🏅 Level: #{db[message.reply_to_message.from.id]["level"]}\n💪 Power: #{db[message.reply_to_message.from.id]["Power"]}\n🕸 Defense: #{db[message.reply_to_message.from.id]["Defanse"]}\n🍎 Resources: #{db[message.reply_to_message.from.id]["res"]}")
	elsif message.text == "Delete-account" && db[message.from.id]
		db.delete(message.from.id)
		bot.api.send_message(chat_id: message.chat.id, text: "All your data has been reset" )
	end
end 
