class StudentsController < ApplicationController

    def new
        @dojos = Dojo.all
        @dojo = Dojo.find(params[:dojo_id])
    end

    def create
        @student = Student.create(student_params)
        redirect_to "/dojos/#{@student.dojo_id}"
    end

    def show
        @student = Dojo.joiner(params[:id])
        @students = Student.cohort(@student)
    end

    def edit
        @dojod = Dojo.all
        @student = Student.find(params[:id])
    end

    def update
        @student = Student.find(params[:id])
        @student.update(student_params)
        redirect_to "/dojos/#{@student.dojo_id}/students/#{@student.id}"
    end

    def destroy
        Student.find(params[:id])
        redirect_to :root
    end

    private
        def student_params
            params.require(:student).permit(:dojo_id, :first_name, :last_name, :email)
        end
end
