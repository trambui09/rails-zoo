require "test_helper"

describe AnimalsController do
  # it "does a thing" do
  #   value(1+1).must_equal 2
  # end

  # this let block is needed for the show tests
  let (:animal) {
    Animal.create name: "Miso", species: "Cat", age: 1
  }
  describe "index" do
    it "can get the index path" do
      get animals_path

      must_respond_with :success
    end

    it "can get the root path" do
      get root_path

      must_respond_with :success
    end

  end

  describe "show" do
    it "can get a valid animal" do

      get animal_path(animal.id)

      must_respond_with :success
    end

    it "will redirect for an invalid task" do

      get animal_path(-1)

      must_respond_with :redirect
      must_redirect_to animals_path
    end


  end

  describe "new" do
    it "can get the new animal page" do

      # verb + path to act
      get new_animal_path

      must_respond_with :success

    end
  end

  describe "create" do
    it "can create a new animal" do
      animal_hash = {
          animal: {
              name: "test",
              species: "new species",
              age: 4
          }
      }

      expect {
        post animals_path, params: animal_hash
      }.must_differ "Animal.count", 1

      new_animal = Animal.find_by(name: animal_hash[:animal][:name])
      expect(new_animal.species).must_equal animal_hash[:animal][:species]
      expect(new_animal.age).must_equal animal_hash[:animal][:age]

      must_respond_with :redirect
      must_redirect_to animals_path
      # must_redirect_to animal_path(new_animal.id)

    end
  end

  describe "edit" do
    it "can get to the edit view" do
      get edit_animal_path(animal.id)

      must_respond_with :success
    end

    it "will redirect if invalid animal id" do

      get edit_animal_path(-1)

      must_respond_with :redirect
      must_redirect_to animals_path

    end
  end

end
