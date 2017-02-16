class WelcomeController < ApplicationController
  def index
    # session[:user_id] ||= 2
    # render({plain: 'Hello World!'})

    # this will automatically look for a file names: home.html.erb within folder: /app/views/welcome
    # it defaults to '.html' because the default 'format' for requests in rubyonrails is always HTML unless you specify otherwise
    # erb: is the default build-in templating system with Rails
    # by default Rails will use 'app/views/layouts/application.html.erb' as the layout, so the content of 'home.html.erb' will be inserted in the place of '<%= yield %> within the layout'
    # render :home
    # the default behavior is to render index.html.erb
  end
  def contact_us
  end
  def contact_submit
    # params gives us access to all GET or POST parameters from the HTTP requests
    # params uses Hashes with indifferent access which means it will work with either symbols or strings as keys
    @name = params[:name]
    # render({plain: 'Form submitted'})
  end
end
