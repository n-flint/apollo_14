require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Class Methods' do
    it '.average_age' do
      astronaut_1 = Astronaut.create(name: "Michale", age: 100, job: "Regional Manager")
      astronaut_2 = Astronaut.create(name: "Dwight", age: 200, job: "Assitant to the Regional Manager")

      expected = 150
      actual = Astronaut.average_age

      expect(actual).to eq(actual)
    end
  end

  describe 'Instance Methods' do
    it '#sort_missions' do
      astronaut_1 = Astronaut.create(name: "Michale", age: 100, job: "Regional Manager")
      mission_1 = Mission.create( title: "Jupiter", time_in_space: 100, astronauts: [astronaut_1])
      mission_2 = Mission.create(title: "Florida", time_in_space: 300, astronauts: [astronaut_1])

      expected = [mission_2, mission_1]
      actual = astronaut_1.sort_missions

      expect(actual).to eq(expected)
    end
    it '#total_time' do
      astronaut_1 = Astronaut.create(name: "Michale", age: 100, job: "Regional Manager")
      mission_1 = Mission.create( title: "Jupiter", time_in_space: 100, astronauts: [astronaut_1])
      mission_2 = Mission.create(title: "Florida", time_in_space: 300, astronauts: [astronaut_1])

      actual = astronaut_1.total_time
      expected = 400

      expect(actual).to eq(expected)
    end

  end
end
