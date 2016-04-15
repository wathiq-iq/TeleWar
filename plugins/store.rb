if !bd[message.from.id] && !@config["bban"].include?(message.from.id)
	if message.text.to_s.start_with?("buy") && message.text.to_s.split.length == 3 && db[message.from.id]
		f = message.text.split
		case f[1]
		when 'pow','💪'
			if f[2].to_i == 1 && db[message.from.id]["Gems"] >= 10
				db[message.from.id]["Power"] += 50
				db[message.from.id]["Gems"] -= 10
		    	bot.api.send_message(chat_id: message.chat.id, text: "💪 [50 power] have been bought for 10 gems" )
		    elsif f[2].to_i == 2 && db[message.from.id]["Gems"] >= 20
				db[message.from.id]["Power"] += 100
				db[message.from.id]["Gems"] -= 20
		    	bot.api.send_message(chat_id: message.chat.id, text: "💪 [100 power] have been bought for 20 gems" )
		    elsif f[2].to_i == 3 && db[message.from.id]["Gems"] >= 30
				db[message.from.id]["Power"] += 250
				db[message.from.id]["Gems"] -= 30
		    	bot.api.send_message(chat_id: message.chat.id, text: "💪 [250 power] have been bought for 30 gems" )
		    else
		    	bot.api.send_message(chat_id: message.chat.id, text: "Cannot purchase")
			end
		when 'def','🕸'
			if f[2].to_i == 1 && db[message.from.id]["Gems"] >= 10
				db[message.from.id]["Defanse"] += 50
				db[message.from.id]["Gems"] -= 10
		    	bot.api.send_message(chat_id: message.chat.id, text: "🕸 [50 defense] have been bought for 10 gems" )
		    elsif f[2].to_i == 2 && db[message.from.id]["Gems"] >= 20
				db[message.from.id]["Defanse"] += 100
				db[message.from.id]["Gems"] -= 20
		    	bot.api.send_message(chat_id: message.chat.id, text: "🕸 [100 defense] have been bought for 20 gems" )
		    elsif f[2].to_i == 3 && db[message.from.id]["Gems"] >= 30
				db[message.from.id]["Defanse"] += 250
				db[message.from.id]["Gems"] -= 30
		    	bot.api.send_message(chat_id: message.chat.id, text: "🕸 [250 defense] have been bought for 30 gems" )
		    else
		    	bot.api.send_message(chat_id: message.chat.id, text: "Cannot purchase" )
			end
		when 'res','🍎'
			if f[2].to_i == 1 && db[message.from.id]["Gems"] >= 15
				db[message.from.id]["res"] += 300
				db[message.from.id]["Gems"] -= 15
		    	bot.api.send_message(chat_id: message.chat.id, text: "🍎 [300 resources] have been bought for 15 gems" )
		    elsif f[2].to_i == 2 && db[message.from.id]["Gems"] >= 25
				db[message.from.id]["res"] += 600
				db[message.from.id]["Gems"] -= 25
		    	bot.api.send_message(chat_id: message.chat.id, text: "🍎 [600 resources] have been bought for 25 gems" )
		    elsif f[2].to_i == 3 && db[message.from.id]["Gems"] >= 35
				db[message.from.id]["res"] += 1200
				db[message.from.id]["Gems"] -= 35
		    	bot.api.send_message(chat_id: message.chat.id, text: "🍎 [1200 resources] have been bought for 35 gems" )
		    else
		    	bot.api.send_message(chat_id: message.chat.id, text: "Cannot purchase" )
			end
		end
	end
end