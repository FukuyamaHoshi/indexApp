class PontController < ApplicationController
    
    def read
        obj = User.all
        render json: obj
    end

    def create
        if request.post? then
            user = User.create(name: params['name'], age: params['age'], sex: params['sex'], uuid: params['uuid'])
            render json: user
        end
    end

    def delete
        if request.post? then
            user = User.find_by(uuid: params['uuid'])
            user.destroy
        end
    end

    def edit
        if request.post? then
            user = User.find_by(uuid: params['uuid'])
            
            if params['name'] != nil then
                user.name = params['name']
            elsif params['age'] != nil then
                user.age = params['age']
            elsif params['sex'] != nil then
                user.sex = params['sex']
            end

            user.save
        end
    end
end
