class SessionController < ApplicationController
    def index

    end

    def login
        render "auth/login"
    end

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])

        else
            flash.now[:danger] = "Invalid email/password combination."
            render 'new'
        end
    end

    def signup_path
        render 'new'
    end

    def destroy
    end
end
