Rails.application.routes.draw do
  # Routes for the Post resource:

  # CREATE
  post("/insert_post", { :controller => "posts", :action => "create" })
          
  # READ
  get("/posts", { :controller => "posts", :action => "index" })
  
  get("/posts/:path_id", { :controller => "posts", :action => "show" })
  
  # UPDATE
  
  post("/modify_post/:path_id", { :controller => "posts", :action => "update" })
  
  # DELETE
  get("/delete_post/:path_id", { :controller => "posts", :action => "destroy" })

  #------------------------------

  # Routes for the Pitch resource:

  # CREATE
  post("/insert_pitch", { :controller => "pitches", :action => "create" })
          
  # READ
  get("/pitches", { :controller => "pitches", :action => "index" })
  
  get("/pitches/:path_id", { :controller => "pitches", :action => "show" })
  
  # UPDATE
  
  post("/modify_pitch/:path_id", { :controller => "pitches", :action => "update" })
  
  # DELETE
  get("/delete_pitch/:path_id", { :controller => "pitches", :action => "destroy" })

  #------------------------------

  devise_for :users

  root to: "pitches#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
