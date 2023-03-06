class CommentsController < ApplicationController
    get "/comments" do
        comments = Comment.all
        comments.to_json(include: [:user, :quote])
    end

    get "/comments/:id" do
        com = Comment.find_by(id: params[:id])
        com.to_json(include: :user)
    end

    post "/comments" do
        comment = params[:comment]
        quote = params[:quote]
        user = params[:user]

        
        if comment.present? && quote.present? && user.present?
            c1 = Comment.create(comment: comment, user_id: user, quote_id: quote)
            if c1
                message = {:success => 'comment added successfully'}
                message.to_json
            else
                message = {:error => 'comment not created successfully'}
                message.to_json
            end
        end
    end
    delete '/comments/:id' do
        comment = Comment.find(params[:id])
        comment.destroy
        comment.to_json
      end
end