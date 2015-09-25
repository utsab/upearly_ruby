require_relative 'db'

require 'mandrill'

enable :inline_templates

get '/' do
  @users = User.all
  erb :index
end

post '/commitments' do
  m = Mandrill::API.new 'Seo6M0XjBHr738AVQ7cESA'

  email = params[:email]

  message = {
     :subject=> "UTSAB signed up for commitment",
     :from_name=> "Your name",
     :text=>"Sup Uts?",
     :to=>[
       {
         :email=> email,
         :name=> "Recipient1"
       }
     ],
     :html=>"<html><h1>Hi <strong>message</strong>Utsab signed up for a commitment</h1><</html>",
     :from_email=>"Foo@bar.com"
    }
  sending = m.messages.send message
  puts sending
  "SENT"

end



get '/' do
  "Learning Ruby on Heroku!"
  # curl # ping mail chimp

end



__END__

@@ index
<h2>Behold our users!!!!!!!!</h2>
<ul>
  <% @users.each do |user| %>
    <li><%= user.username %></li>
  <% end %>
</ul>

@@ layout
<html>
<head>
  <title>My App</title>
</head>
<body>
  <%= yield %>
</body>
</html>


