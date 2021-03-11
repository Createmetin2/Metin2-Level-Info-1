quest level_info begin
	state start begin
		function GetLevelInfo(level)
			-- syschat: CHAT_TYPE_INFO
			-- notice: CHAT_TYPE_NOTICE
			tLevelInfo = {
				[90] =
				{
					{ ["message"] = string.format("You reached %d level!", level), ["type"] = notice },
					{ ["message"] = "Congratulations", ["type"] = syschat },
				},
				[91] =
				{
					{ ["message"] = "Test", ["type"] = syschat },
				},
			}
			return tLevelInfo[level]
		end

		when levelup begin         
			local lInfo = level_info.GetLevelInfo(pc.get_level())
			if lInfo ~= nil then
				for k, v in ipairs (lInfo) do
					v["type"](v["message"])
				end
			end
		end
	end
end