require 'rails_helper'

RSpec.describe 'as a visitor' do
  describe 'when it visits the index page' do
    before :each do
      @astronaut_1 = Astronaut.create(name: "Michale", age: 100, job: "Regional Manager")
      @astronaut_2 = Astronaut.create(name: "Dwight", age: 200, job: "Assitant to the Regional Manager")
      @mission_1 = Mission.create( title: "Jupiter", time_in_space: 100, astronauts: [@astronaut_1])
      @mission_2 = Mission.create(title: "Venus", time_in_space: 200, astronauts: [@astronaut_2])
      @mission_3 = Mission.create(title: "Florida", time_in_space: 300, astronauts: [@astronaut_1, @astronaut_2])
    end

    it 'can see a list of all the astronauts' do
      visit astronauts_path

      expect(page).to have_content("All Astronauts")

      within  "#astronaut-#{@astronaut_1.id}" do
      expect(page).to have_content(@astronaut_1.name)
      expect(page).to have_content(@astronaut_1.age)
      expect(page).to have_content(@astronaut_1.job)
      end

      within "#astronaut-#{@astronaut_2.id}" do
        expect(page).to have_content(@astronaut_2.name)
        expect(page).to have_content(@astronaut_2.name)
        expect(page).to have_content(@astronaut_2.name)
      end
    end

    it 'can see average age of all astronauts' do
      visit astronauts_path

      expect(page).to have_content("Average Age: 150")
    end

    it 'astronauts missions are in alphabetical order' do
      visit astronauts_path

      within "#astronaut-#{@astronaut_1.id}" do
        expect(page).to have_content("#{@mission_3.title}\n#{@mission_1.title}")

      end

      within "#astronaut-#{@astronaut_2.id}" do
        expect(page).to have_content("#{@mission_3.title}\n#{@mission_2.title}")
      end
    end

    it 'can see the total time in space for each astronaut' do
      visit astronauts_path

      within  "#astronaut-#{@astronaut_1.id}" do
        expect(page).to have_content("Total Time In Space: 400")
      end
    end


  end
end
