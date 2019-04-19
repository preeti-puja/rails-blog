class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
end


class Def
    array_of_operation = [:add, :sub]

    array_of_operation.each do |a|
        define_method a do |a, b, operation|
            a.send(operation, b) 
        end
    end

end