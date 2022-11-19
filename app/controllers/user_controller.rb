class UserController < ApplicationController
  require 'rest-client'
  require 'json'

  def index
    page = index_params[:page]
    url = "https://reqres.in/api/users?page=" + page
    @json_string = RestClient.get(url)
    @json_hash = JSON.parse(@json_string)
  end

  def search
    page = search_params[:page].to_s
    query = search_params[:query]
    url = "https://reqres.in/api/users?page=" + page
    @json_string = RestClient.get(url)
    @json_hash = JSON.parse(@json_string)
    @json_hash = @json_hash["data"].select { |h| h['email'] == query }
  end

  def show
    id = show_params[:id]
    url = "https://reqres.in/api/users/" + id
    json_string = RestClient.get(url)
    json_hash = JSON.parse(json_string)
    @json_hash = json_hash['data']
  end
  
  private

    # Only allow a list of trusted parameters through.
    def index_params
      params.permit(:page)
    end
    
    # Only allow a list of trusted parameters through.
    def show_params
      params.permit(:id, :email, :firstName, :lastName, :avatar)
    end

    # Only allow a list of trusted parameters through.
    def search_params
      params.permit(:page, :query)
    end
end
