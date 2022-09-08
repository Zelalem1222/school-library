require './capitalize_decorator'
require './trimmer_decorator'
require './person'


describe Decorator do
    before(:each) do
        @person = Person.new(18, 'john', 1)
        @capitalize_decorator = CapitalizeDecorator.new(@person)
        @trimmer_decorator = TrimmerDecorator.new(@capitalize_decorator)
    end

    it "should return the correct name" do
        expect(@capitalize_decorator.correct_name).to eq "John"
    end

    it "should return the correct name" do
        expect(@trimmer_decorator.correct_name).to eq "John"
        # expect(@trimmer_decorator.correct_name.length).to be <= 10
    end

end