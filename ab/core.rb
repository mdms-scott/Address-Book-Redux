class App < Sinatra::Base
  
  set :method_override, true
  
  get '/stylesheet.css' do
    sass :stylesheet
  end
  
  get '/' do
    @people = Person.sort(:last_name).all
    haml :index
  end
  
  get '/new' do
    @person = Person.new
    haml :new
  end
  
  post '/' do
    @person = Person.new(params[:person])
    if @person.save
      redirect '/'
    else
      redirect '/new'
    end
  end
  
  get '/:id' do |id|
    @person = Person.find(id)
    haml :show
  end
  
  get '/:id/edit' do |id|
    @person = Person.find(id)
    haml :edit
  end
  
  put '/:id' do |id|
    @person = Person.find(id)
    @person.update_attributes(params[:person])
    haml :show
  end
  
  delete '/:id' do |id|
    @person = Person.find(id)
    @person.destroy
    redirect '/'
  end
  
end