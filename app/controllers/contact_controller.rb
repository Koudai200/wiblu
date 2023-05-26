class ContactController < ApplicationController

    def new
        @contact = Contact.new
    end

    def create        
        @contact = Contact.new(
            name: :params[:name],
            email: :params[:email],
            subject: :params[:subject],
            message: :params[:message]
        )
        if @contact.save
            flash[:notice] = "お問い合わせありがとうございます。"
            redirect_to contacts_path
        else
            render :new
        end
    end
      
end
