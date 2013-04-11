require 'flowdock'

module Janky
	module ChatService
		class Flowdock
			def initialize(settings)
				token = settings["JANKY_CHAT_FLOWDOCK_TOKEN"]
				if token.nil? || token.empty?
					raise Error, "JANKY_CHAT_FLOWDOCK_TOKEN setting is required"
				end

				@from_name = settings["JANKY_CHAT_FLOWDOCK_FROM_NAME"] || "CI"
				@client = ::Flowdock::Flow.new(:api_token=>token, :external_user_name => @from_name)
			end

			def speak(message, room_id, options = {})
				@client.push_to_chat(:content => message, :tags => ["ci"])
			end

			def rooms
				[]
			end

		end
	end
end

