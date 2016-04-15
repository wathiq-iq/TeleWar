if !bd[message.from.id] && !@config["bban"].include?(message.from.id)
	c = message.text.to_s.split
	if message.text.to_s.start_with?("#clan") && message.text.to_s.split.length == 3 && db[message.from.id]
		case c[1]
		when "create"
			if db[message.from.id]["res"] >= 150
				rid = rand(0000001..9999999)
				cn[rid] = {"id"=>rid,
				"name"=>c[2],
		    	"level"=>1,
		    	"members"=>{
		    		message.from.id=>"#{message.from.first_name} #{message.from.last_name}"
		    		}}
		    	db[message.from.id]["clan"] = cn[rid]["name"]
		    	bot.api.send_message(chat_id: message.chat.id, text: "clan was created!")
		    end
		when "join"
			db[message.from.id]["clan"] = cn[c[2].to_i]["id"]
			cn[c[2].to_i]["members"][message.from.id] = "#{message.from.first_name} #{message.from.last_name}"
		    bot.api.send_message(chat_id: message.chat.id, text: "You are member of #{cn[c[2].to_i]["name"]} clan !!")
		when "info"
		    bot.api.send_message(chat_id: message.chat.id, text: "Clan: #{cn[c[2]]["name"]}\nID: #{cn[c[2]]["id"]}\nLevel: #{cn[c[2]]["level"]}")
		end
	end
	if message.text.to_s.start_with?("#clan") && c[1] == "out"
		cn[db[message.from.id]["clan"]]["members"].delete(message.from.id)
		db[message.from.id]["clan"] = "none"
	    bot.api.send_message(chat_id: message.chat.id, text: "You'r out from clan !!")
	end
end