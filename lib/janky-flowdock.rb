require 'flowdock'
require 'janky-flowdock/version'

module Janky
	module ChatService
		class Flowdock
			def initialize(settings)
				token = settings["JANKY_CHAT_FLOWDOCK_TOKEN"]
				if token.nil? || token.empty?
					raise Error, "JANKY_CHAT_FLOWDOCK_TOKEN setting is required"
				end

				from_name = settings["JANKY_CHAT_FLOWDOCK_FROM_NAME"] || "CI"
        from_email = settings["JANKY_CHAT_FLOWDOCK_FROM_EMAIL"]
        source = settings["JANKY_CHAT_FLOWDOCK_SOURCE"] || "Janky"

				@client = ::Flowdock::Flow.new(api_token: token, source: source, from: {name: from_name, address: from_email})
			end

			def speak(message, room_id, options = {})
        subject = "CI build status"
				@client.push_to_team_inbox(content: message, subject: subject, tags: ["ci"])
			end

			def rooms
				[]
			end

		end
	end
end

