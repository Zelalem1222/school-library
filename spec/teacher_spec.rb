require_relative '../teacher'

describe Teacher do

    before(:each) do
        @teacher = Teacher.new(30, 'John', 'php', 1)
    end

    it "takes four parameters and returns a Teacher object" do
        expect(@teacher).to be_an_instance_of Teacher
    end

    it "returns the correct age" do
        expect(@teacher.age).to eq 30
    end

    it "returns the correct name" do
        expect(@teacher.name).to eq "John"
    end

    it "returns the correct specialization" do
        expect(@teacher.specialization).to eq "php"
    end

    it "returns the correct id" do
        expect(@teacher.id).to eq 1
    end

    it "returns the correct class" do
        expect((@teacher.class).to_s).to eq 'Teacher'
    end

    it "returns the correct number of rentals" do
        expect(@teacher.rentals).to eq []
    end

    it "returns the correct name" do
        expect(@teacher.correct_name).to eq "John"
    end
end