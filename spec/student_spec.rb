require './student'

describe Student do

    before(:each) do
        @student = Student.new(12, "Kevin", "Class 1", 1)
    end

        it "takes the parameters and returns a Student object" do
            expect(@student).to be_an_instance_of Student
        end

        it "returns the correct age" do
            expect(@student.age).to eq 12
        end

        it "returns the correct name" do
            expect(@student.name).to eq "Kevin"
        end

        it "returns the correct classroom" do
            expect(@student.classroom).to eq "Class 1"
        end

        it "returns the correct id" do
            expect(@student.id).to eq 1
        end

        it "return the correct class" do
            expect((@student.class).to_s).to eq 'Student'
        end
end