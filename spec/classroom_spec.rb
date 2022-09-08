require './classroom'

describe Classroom do
    before(:each) do
        @classroom = Classroom.new('The Classroom')
    end

        it "takes one parameter and returns a Classroom object" do
            expect(@classroom).to be_an_instance_of Classroom
        end
    
 
        it "returns the correct name" do
            expect(@classroom.lable).to eq "The Classroom"
        end
    
    
        it "returns the correct students" do
            expect(@classroom.students).to eq []
        end
   
    
end
