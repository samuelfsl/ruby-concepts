class CommentsController < ApplicationController
    before_action :set_post
    before_action :authenticate_user!, only: %i[ new edit update destroy ]
    def create 
        @post.comments.create! params.required(:comment).permit(:content)
        redirect_to @post
    end

    def set_post
        @post = Post.find(params[:post_id])
    end
end
