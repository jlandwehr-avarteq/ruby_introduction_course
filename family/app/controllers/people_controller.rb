class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :set_animal_types, only: :show
  before_action :set_degrees, only: [:new, :edit, :create, :update]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
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
    @person.degrees = Degree.where(id: person_degrees_params)

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
    @person.degrees = Degree.where(id: person_degrees_params)
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

  def person_degrees_params
    params[:person][:degree_ids]
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
      address_attributes:
      [ :number,
        :street,
        :zip_code,
        :city,
        :country
      ]
    )
  end
end