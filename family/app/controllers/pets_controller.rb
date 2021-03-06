class PetsController < ApplicationController
  before_action :set_person, only: [:create, :destroy, :edit, :update]
  before_action :set_animal_types, only: [:create, :new, :update, :edit]
  before_action :set_pet, only: [:edit, :update, :destroy]

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = @person.pets.build(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to person_path(@person), notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to person_path(@person), notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy

    respond_to do |format|
      format.html { redirect_to person_path(@person), notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def set_person
    @person = Person.find(params[:person_id])
  end

  def set_animal_types
    @types = Pet::ANIMAL_TYPES
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pet_params
    params.require(:pet).permit(:type, :name, :age)
  end
end
