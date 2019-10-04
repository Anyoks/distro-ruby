
module Mutations
    class MutationResult
      def self.call(obj: {}, success: true, errors: [])

        # byebug
        # if obj[obj.keys.first].class == Array
        #   # itertate and merge
        #   obj[obj.keys.first].each do |item|
        #     item.merge(success: success, errors: errors)
        #   end
        # else
          obj.merge(success: success, errors: errors)
        # end
        
      end
    end
  end