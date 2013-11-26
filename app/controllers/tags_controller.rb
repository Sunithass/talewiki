class TagsController < ApplicationController
layout 'master'
# GET /tags
# GET /tags.json

def index

@tags = Tag.all

respond_to do |format|
   format.html #index.html.erb
   format.json { render json: @tags }
end
end
# GET /tags/new
# GET /tags/new.json

def new
 
 @tale = Tale.find(params[:id])
 session[:tale_id] = params[:id]

respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tag }
    end
end

# POST /tags
# POST/tags.json

def create
@tale = Tale.find(session[:tale_id])
@tags = Tag.new(params[:tag])
@tag.tale_id = session[:tale_id]
@tag.user_id = session[:user_id]
@tags_tale = tags[:name]
@tale.tag_list = params[:tags_tale]

   
    if @tag.save
      flash[:notice] =  'The tale was successfully tagged' 
redirect_to  :controller => 'tales',   :action => 'index' 
else
        redirect_to :action =>  'new'
       
end
end


def tag_cloud
 @tags = Tale.tag_counts
end

# GET /tags/1
# GET /tags/1.json
def search
  render: =>'search'
end

def result
 tags = params[:tag]
 query_tag = tags[:name]
 @tales = Tale.find_tagged_with(query_tag)
 render :layout=>"empty"
end

def result_search
query_tag = params[:tag]
@tales = Tale.find_tagged_with(query_tag)
end
end
