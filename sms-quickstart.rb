require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

set :port, 3490

get '/sms-quickstart' do
    sender = params[:From]
    content = params[:Body] || "Unknown Content"
    known = {
        "+15127508705" => "Amar Rama",
        "+15124960131" => "Kim Rama"
    }
    name = known[sender] || "Mobile Donkey"

    twiml = Twilio::TwiML::Response.new do |r|
        r.Message "Hello, #{name}. Good to hear from you. Did you say #{content}"
    end
    twiml.text
end