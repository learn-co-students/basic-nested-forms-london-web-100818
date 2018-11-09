class PeopleController < ApplicationController

  def index
    @people = Person.all
  end


  def new
    @person = Person.new
    @person.addresses.build(address_type: 'work')
    @person.addresses.build(address_type: 'home')
  end

  def create
    Person.create(person_params)
    redirect_to people_path
  end


  private

  def person_params
    params.require(:person).permit(:name)
  end
end
