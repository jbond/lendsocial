class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @message = Message.new
  end

  def create
    build_message
    @message_params[:author_id] ||= current_user.id

    respond_to do |format|
      format.html do
        if @message.save
          if request.xhr?
            if params[:message_id]
              @message = Message.find(params[:message_id])
              render partial: 'messages/comments_list', locals: {message: @message}
            else
              @messages = case @message_params[:posted_to_type]
              when "User"
                user = User.find(@message_params[:posted_to_id])
                @kaminari_params = {controller: 'users', action: 'comments', id: user.id}
                Message.for_user(user).with_comments.page(1)
              when "Business"
                business = Business.find(@message_params[:posted_to_id])
                @kaminari_params = {controller: 'businesses', action: 'comments', id: business.id}
                Message.for_business(business).with_comments.page(1)
              end
              render template: 'messages/list', layout: false
            end
          else
            redirect_to root_path
          end
        else
          render json: @message.errors, status: :unprocessable_entity
        end
      end
    end
  end

  protected

  def build_message
    if params[:message_id]
      @message_params = params[:"comment_#{params[:message_id]}"]
      @message = Message.find(params[:message_id]).comments_on.build(@message_params)
    else
      @message_params = params[:message]
      @message = Message.new(@message_params)
    end
  end

end
