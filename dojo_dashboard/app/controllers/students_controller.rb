require_relative 'dojos_controller'
class StudentsController < ApplicationController

    def index
        @dojos = Dojo.find(params[:id])
        @student = Student.find(params[:id])
    end

    def new
        @dojos = Dojo.all
    end

    def create
        @dojo = Dojo.find(params[:id])
        @student = Student.create(student_params)
        redirect_to "/dojos/:dojo_id"
    end

    def show
        @dojo = Dojo.find(params[:id])
        @student = Student.find(params[:id])
    end

    def edit
        @dojo = Dojo.find(params[:id])    
        @student = Student.find(params[:id])
    end

    def update
        @student = Student.find(params[:id])
        @student.update(student_params)
        redirect_to "/dojos/#{@dojo.id}/students/#{@student.id}"
    end

    private
        def student_params
            params.require(:student).permit(:dojo_id, :first_name, :last_name, :email)
        end
end
