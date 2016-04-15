if message && db[message.from.id]
	if db[message.from.id]["Power"] >= 400 && db[message.from.id]["Power"] < 600 
			db[message.from.id]["level"] = 2
	elsif db[message.from.id]["Power"] >= 600 && db[message.from.id]["Power"] < 800
			db[message.from.id]["level"] = 3
	elsif db[message.from.id]["Power"] >= 800 && db[message.from.id]["Power"] < 1200
			db[message.from.id]["level"] = 4
	elsif db[message.from.id]["Power"] >= 1200 && db[message.from.id]["Power"] < 1600
			db[message.from.id]["level"] = 5
	elsif db[message.from.id]["Power"] >= 1600 && db[message.from.id]["Power"] < 2000
			db[message.from.id]["level"] = 6
	elsif db[message.from.id]["Power"] >= 2000 && db[message.from.id]["Power"] < 3000
			db[message.from.id]["level"] = 7
	elsif db[message.from.id]["Power"] >= 3000
			db[message.from.id]["level"] = 8
	end
end