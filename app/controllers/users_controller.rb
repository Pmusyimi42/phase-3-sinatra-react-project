class UsersController < ApplicationController
    get "/users" do 
        users = User.all
        users.to_json
    end

    get"/users/:id" do
        quotes = User.find_by(id: params[:id])
        quotes.to_json
    end
    


    post "/users" do
        username = params[:username]
        if username.present?
            user = User.create(username: username)

            if user
            message = {:success => "The user was successfully created"}
            message.to_json
            else
                message = {:error => "The user could not be created"}
                message.to_json
            end
        else
            message = {:error => "Must provide a user name"}
            message.to_json

        end
    end

    delete "/users/:id" do

        user = User.find(params[:id])

        user.destroy

        user.to_json
    end
end