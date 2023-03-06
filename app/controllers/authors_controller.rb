class AuthorsController < ApplicationController
    get "/authors" do
        authors = Author.all
        authors.to_json
    end

    get "/authors/:id" do
        author = Author.find_by(id: params[:id])
        author.to_json
    end

    post "/authors" do
        name = params[:name]

        if name.present?

            author = Author.create(name: name)

            if author
                message = {:success => "Author created successfully"}
                message.to_json
            else
                message = {:error => "Author creation failed"}
                message.to_json
            end
        end
    end

    delete "/authors/:id" do
        author = Author.find(params[:id])
        author.destroy
        author.to_json
    end
end