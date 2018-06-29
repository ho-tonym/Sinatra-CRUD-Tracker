class GazorpianController < Sinatra::Base

  get '/gazorpians' do
    if logged_in?
      @gazorpians = Gazorpian.all
      erb :'/gazorpians/gazorpians'
    else
      redirect '/login'
    end
  end

  get '/gazorpians/new' do
    if logged_in?
      erb :'gazorpians/create_gazorpian'
    else
      redirect 'login'
    end
  end

  post '/gazorpians' do
    @gazorpian = current_user.gazorpians.build(content: params[:content])
    if params[:content] == "" || !@gazorpian.save
      redirect '/gazorpians/new'
    else
      redirect "/gazorpians/#{@gazorpian.id}"
    end
  end

  get '/gazorpians/:id' do
    if logged_in?
      @gazorpian = Gazorpian.find_by_id(params[:id])
      erb :'gazorpians/show_gazorpian'
    else
      redirect '/login'
    end
  end

  get '/gazorpians/:id/edit' do
    if logged_in?
      @gazorpian = Gazorpian.find(params[:id])
      if @gazorpian && @gazorpian.user == current_user
        erb :'gazorpians/edit_gazorpian'
      else
        redirect '/gazorpians'
      end
    else
      redirect '/login'
    end
  end

  patch '/gazorpians/:id' do
    if logged_in?
      if params[:content] == ""
        redirect to "/gazorpians/#{params[:id]}/edit"
      else
        @gazorpian = Gazorpian.find_by_id(params[:id])
        if @gazorpian && @gazorpian.user == current_user
          if @gazorpian.update(content: params[:content])
            redirect to "/gazorpians/#{@gazorpian.id}"
          end
        end
      end
    end
  end

  delete '/gazorpians/:id/delete' do
    if logged_in?
      @gazorpian = Gazorpian.find_by_id(params[:id])
      if @gazorpian && @gazorpian.user == current_user
        @gazorpian.delete
        redirect "/gazorpians"
      else
        redirect "/login"
      end
    end
  end
end
