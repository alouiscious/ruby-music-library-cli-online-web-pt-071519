# require_all 'lib'
# require_relative '../lib/artist.rb'
# require_relative '../lib/song.rb'
module Concerns

    module Findable
        def self.find_by_name(name)
            @@all.find {|song| song.name == name}
    
        end
    
        def self.find_or_create_by_name(name)
            self.find_by_name(name) || self.create(name)
            # song = self.find_by_name(name)  # smaller code prevent calling find by name more than once
            # song ? song : self.create(name)
    
            # self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
        end
    end
end


#     def destroy_all
#         @@all.clear
#     end

# end