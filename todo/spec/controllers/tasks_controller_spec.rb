require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  before :each do
    @task = FactoryGirl.create(:task)
  end

  describe 'GET #root' do
    it 'renders root/index page' do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it 'assign new task' do
      get :index
      #which one is better?
      expect(assigns(:tasks).last).to eq(@task)
      expect(Task.last).to eq(@task)
    end
  end

  describe 'POST #create' do
    context 'valid attributes' do
      it 'saves tasks' do
        expect{
          post :create, task: FactoryGirl.attributes_for(:task)
        }.to change(Task, :count).by(1)
      end

      it 'redirects to root' do
        post :create, task: FactoryGirl.attributes_for(:task)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'invalid attributes' do
      it 'not saves tasks' do
        expect{
          post :create, task: FactoryGirl.attributes_for(:invalid_task)
        }.to change(Task, :count).by(0)
      end
    end
  end

  describe 'GET #show' do
    before :each do
      get :show,
        id: @task
    end

    it 'chooses right task' do
      expect(assigns(:task)).to eq(@task)
    end

    it 'renders the show template' do
			expect(response).to render_template(:show)
		end
  end

  describe 'GET #edit' do
   before :each do
      get :edit,
      id: @task
    end

    it 'chooses right task' do
      expect(assigns(:task)).to eq(@task)
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update_status' do
    #TODO ????
  end

  describe 'PUT #update' do
    before :each do
      @special_task = FactoryGirl.create(:task, title:'Special Task', description: 'Special Task Descripton')
    end

    context 'valid attributes' do
      it 'updates task' do
        put :update, id: @special_task, task: FactoryGirl.attributes_for(:task, title: 'New Task', description: 'New Description')
        @special_task.reload
        expect(@special_task.title).to eq('New Task')
        expect(@special_task.description).to eq('New Description')
      end
    end

    context 'invalid attributes' do
      it 'does not updates task' do
        put :update, id: @special_task, task: FactoryGirl.attributes_for(:task, title: nil, description: 'New Description')
        @special_task.reload
        expect(@special_task.title).to eq('Special Task')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'deletes entry' do
      expect{
        delete :destroy, id: @task
      }.to change(Task, :count).by(-1)
    end
  end
end
