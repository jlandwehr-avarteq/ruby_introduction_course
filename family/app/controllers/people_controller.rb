class PeopleController < ApplicationController
  before_action :set_person, only: %i(show edit update destroy)
  before_action :set_animal_types, only: :show
  before_action :set_degrees, only: %i(new edit create update)
  before_action :select_possible_friends, only: %i(edit update)
  before_action :set_person_degrees_from_params, only: %i(create update)
  before_action :set_person_friends_from_params, only: :update
  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @family = Person.family_members(@person)
  end

  # GET /people/new
  def new
    @person = Person.new
    @person.build_address
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update

    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  def set_degrees
    @degrees = Degree.all
  end

  def set_animal_types
    @types = Pet::ANIMAL_TYPES
  end

  def set_person_degrees_from_params
    @person.degrees = Degree.where(id: params[:person][:degree_ids])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params
    .require(:person)
    .permit(:first_name,
      :last_name,
      :phone,
      :age,
      :email,
      :email_confirmation,
      :friend_ids,
      address_attributes:
      [ :number,
        :street,
        :zip_code,
        :city,
        :country
      ]
    )
  end

  #selects all people that are not friends with @person
  def select_possible_friends
    @possible_friends = Person.all.to_a - @person.friends.to_a - [@person]
  end

  def set_person_friends_from_params
    @person.friends = Person.where(id: params[:person][:friend_ids])
  end
end
