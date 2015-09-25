require_relative 'db'

enable :inline_templates

get '/' do
  @users = User.all
  erb :index
end

post '/commitments' do
  email = params[:email]

  p email
  @users = User.all
  erb :index
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


