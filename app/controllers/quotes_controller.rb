
class QuotesController < ApplicationController
    get "/quotes" do
        quotes = Quote.all
        quotes.to_json(include: [:author, :comments, :users])
    end

    get"/quotes/:id" do
        quotes = Quote.find_by(id: params[:id])
        quotes.to_json
    end

    post "/quotes" do
        title = params[:title]
        category = params[:category]
        description = params[:description]
        author_name = params[:author]

        if title.present? && category.present? && description.present?
            # check_author = Author.find_by(name: author_name)
            # if check_author
            #     quote = Quote.create(title: title, category: category, description: description, author_id: check_author.id)
            # end
            new_author =Author.create(name: author_name)
            quote = Quote.create(title: title, category: category, description: description, author_id: new_author.id)

            if quote 
                message ={:success => "quote added successfully"}
                message.to_json
            else
                message = {:error => "quote could not be added successfully"}
                message.to_json
            end
        else
            message = {:error => "Kindly fill the required field"}
            message.to_json
        end
        
    end

    patch "/quotes/update/:id" do 
        quote = Quote.find_by(id: params[:id])
    
        quote.update(
            title: params[:title],
            category: params[:category],
            description: params[:description],
            author_name: params[:author]
        )
        quote.to_json()
    end

    delete "/quotes/:id" do
        quote = Quote.find(params[:id])
        quote.destroy
        quote.to_json
    end
end
