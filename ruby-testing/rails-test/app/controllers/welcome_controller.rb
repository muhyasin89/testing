class WelcomeController < ApplicationController


  def index

    @path=Rails.root + ""
    @parent=File.expand_path("..", @path) + "/ini_test_ga.txt"
    @parent =File.read(@parent)


    if(params.has_key?(:id) && params.has_key?(:random))
        @id=params['id']
        @random = params[:random]
    end
    #render :text => @parent
  #  render file: @parent, layout: false, content_type: 'text/plain'
  end

  def show
      @show = 'wew'
  end

  def sample
      @controller_message='wew'
  end

  def update
     # puts.inspect(request.post?)

  end

  def create
  end

  def form_test
      render "test/form"
  end
end
