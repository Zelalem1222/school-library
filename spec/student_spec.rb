require_relative '../student'

describe Student do
  before(:each) do
    @student = Student.new(19, 'Kevin', 'Class 1', 1)
  end

  it 'takes the parameters and returns a Student object' do
    expect(@student).to be_an_instance_of Student
  end

  it 'returns the correct age' do
    expect(@student.age).to eq 19
  end

  it 'returns the correct name' do
    expect(@student.name).to eq 'Kevin'
  end

  it 'returns the correct classroom' do
    expect(@student.classroom).to eq 'Class 1'
  end

  it 'returns the correct id' do
    expect(@student.id).to eq 1
  end

  it 'return the correct class' do
    expect(@student.class.to_s).to eq 'Student'
  end

  it 'returns the correct number of rentals' do
    expect(@student.rentals).to eq []
  end

  it 'returns the correct name' do
    expect(@student.correct_name).to eq 'Kevin'
  end

  it 'returns false if the student is not of age' do
    expect(@student.can_use_services?).to eq true
  end

  it "returns '¯\(ツ)/¯' if the student plays hooky" do
    expect { @student.play_hooky }.to output("¯\(ツ)/¯\n").to_stdout
  end
end
