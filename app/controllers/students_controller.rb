class StudentsController < ApplicationController
    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params(:first_name, :last_name))
        @student.save
        redirect_to student_path(@student)
    end

    def show
        @student = Student.find(params[:id])
    end

    def edit
        set_student
    end

    def update
        set_student
        @student.update(student_params(:first_name, :last_name))
        redirect_to student_path(@student)
    end

                private
                                def student_params(*args)
                                    params.require(:student).permit(*args)
                                end

                                def set_student
                                    @student = Student.find(params[:id])
                                end
end