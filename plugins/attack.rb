
if !bd[message.from.id] && !@config["bban"].include?(message.from.id)
	if message.text == "attack" or message.text == "⚔"
		if db[message.from.id] && message.reply_to_message && db[message.reply_to_message.from.id] && db[message.from.id]["level"] <= db[message.reply_to_message.from.id]["level"] && message.from.id != message.reply_to_message.from.id
			bot.api.send_message(chat_id: message.chat.id, text: "⚔The War Begins⚔\n#{message.from.first_name} #{message.from.last_name}\nVS\n#{message.reply_to_message.from.first_name} #{message.reply_to_message.from.last_name}\n")
			puts "#{message.from.username} Attacks on #{message.reply_to_message.from.username}".on_red		
			sleep 1
			if db[message.from.id]["Power"] >= db[message.reply_to_message.from.id]["Defanse"]
				if db[message.from.id]["res"] >= 50
					lnumbers = [6,5,5,4,4,4,3,3,3,3,2,2,2,2,2,1,1,1,1,1,1]
					d = lnumbers.sample(1)
					rss = SecureRandom.random_number(35)+db[message.reply_to_message.from.id]["res"]/5
					bot.api.send_message(chat_id: message.chat.id, text: "📯The War was Finished📯\nThe Winner is\n👾 #{message.from.first_name} #{message.from.last_name}\nRewards:\nResources +#{rss}🍎\nPower +25💪\nGems +#{d[0]}💎\nOpponents Loses:\nDefense -10🕸" )
					puts "#{message.from.username} is the winner!!".on_green		
					db[message.from.id]["Gems"] += d[0]
					db[message.from.id]["Power"] += 25
					if db[message.reply_to_message.from.id]["Defanse"] >= 10
						db[message.reply_to_message.from.id]["Defanse"] -=10
					end
					db[message.from.id]["Attacks"] +=1
					db[message.from.id]["Wins"] +=1
					db[message.from.id]["res"] -=50
					db[message.from.id]["res"] +=rss
					db[message.reply_to_message.from.id]["res"] -=db[message.reply_to_message.from.id]["res"]/5
					db[message.reply_to_message.from.id]["Defanse_a"] +=1
					db[message.reply_to_message.from.id]["dd_loses"] +=1
				else
					bot.api.send_message(chat_id: message.chat.id, text: "Invalid Attack" )
				end
			elsif db[message.from.id]["Power"] <= db[message.reply_to_message.from.id]["Defanse"]
				if db[message.from.id]["Power"] >= 10 && db[message.from.id]["res"] >= 50
					rss2 = SecureRandom.random_number(25)
					bot.api.send_message(chat_id: message.chat.id, text: "📯The War was Finished📯\nThe Winner is\n👾 #{message.reply_to_message.from.first_name} #{message.reply_to_message.from.last_name}\nTotal Results:\nResources +#{rss2}🍎\nPower -10💪\nOpponents Defense +25" )
					puts "#{message.reply_to_message.from.username} is the winner!!".on_green		
					db[message.from.id]["Power"] -= 10
					db[message.reply_to_message.from.id]["Defanse"] +=25
					db[message.from.id]["Attacks"] +=1
					db[message.from.id]["Loses"] +=1
					db[message.from.id]["res"] -=35
					db[message.from.id]["res"] +=rss2
					db[message.reply_to_message.from.id]["Defanse_a"] +=1
					db[message.reply_to_message.from.id]["dd_win"] +=1
				else
				    bot.api.send_message(chat_id: message.chat.id, text: "Invalid Attack" )
				end
			end
		else
		    bot.api.send_message(chat_id: message.chat.id, text: "Invalid Attack" )
		end
	end
end
