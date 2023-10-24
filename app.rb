require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_new)

end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2

  erb(:square_root_new_results)

end

get("/payment/new") do
  erb(:payment_new)

end

get("/payment/results") do
  @apr = params.fetch("apr").to_f
  @years = params.fetch("years").to_i
  @principal = params.fetch("principal").to_f

  # Convert APR to a monthly rate
  monthly_rate = (@apr / 100.0) / 12.0

  # Convert years to months
  number_of_payments = @years * 12

  # Calculate the monthly payment
  @the_result = @principal * (monthly_rate * (1 + monthly_rate) ** number_of_payments) / ((1 + monthly_rate) ** number_of_payments - 1)

  erb(:payment_new_results)
end

get("/random/new") do
  erb(:random_new)

end

get("/random/results") do
  @min_num = params.fetch("min_input").to_i
  @max_num = params.fetch("max_input").to_i
  @random_num = rand(@min_num..@max_num)

  erb(:random_new_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
