class Recipe
    
    include HTTParty
    
    @key_value = ENV['FOOD2FORK_KEY'] || '4690a5e4c20b2a3a360ea6b03e8bb57d'
    hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
    base_uri "http://#{hostport}/api"
    default_params key: @key_value
    format :json
    
    def self.for term
        get('http://food2fork.com/api/search', query: {q: term})['recipes']
    end
    
end