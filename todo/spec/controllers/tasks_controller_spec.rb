require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe 'GET #root' do
    let!(:task) { FactoryGirl.create(:task) }

    it 'renders root/index page' do
      get :index

      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it 'assign task' do
      expect(Task.last).to eq(task)
    end

    it 'should display the tasks, include the last created one' do
      get :index

      expect(assigns(:tasks)).to include(task)
    end
  end

  describe 'POST #create' do
    let(:valid_task_attrs) { FactoryGirl.attributes_for(:task) }
    let(:invalid_task_attrs) { FactoryGirl.attributes_for(:invalid_task) }

    context 'valid attributes' do
      it 'should save valid task' do
        expect{ post :create, task: valid_task_attrs }.to change(Task, :count).by(1)
      end

      it 'should redirects to root' do
        post :create, task: valid_task_attrs

        expect(response).to redirect_to(root_path)
      end
    end

    context 'invalid attributes' do
      it 'should not saves tasks' do
        tasks_count = Task.all.count
        post :create, task: invalid_task_attrs
        expect(Task.all.count).to eq(tasks_count)
      end

      it 'should redirect to root' do
        post :create, task: invalid_task_attrs
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET #show' do
    let!(:task) { FactoryGirl.create(:task) }

    it 'chooses the right task' do
      get :show, id: task.id

      expect(assigns(:task)).to eq(task)
    end

    it 'renders the show template' do
      get :show, id: task.id
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    let!(:task) { FactoryGirl.create(:task) }

    it 'chooses the right task' do
      get :edit, id: task.id

      expect(assigns(:task)).to eq(task)
    end

    it 'renders the edit template' do
      get :edit, id: task.id

      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #update_status' do
    let!(:task) { FactoryGirl.create(:task) }

    it 'changes the status' do
      task_status = task.status

      post :update_status, id: task.id
      task.reload
      expect(task.status).not_to eq(task_status)
    end
  end

  describe 'PUT #update' do
    let!(:task) { FactoryGirl.create(:task, title:'Special Task', description: 'Special Task Descripton') }

    context 'valid attributes' do
      it 'updates task' do
        put :update, id: task.id, task: FactoryGirl.attributes_for(:task, title: 'New Task', description: 'New Description')
        task.reload
        expect(task.title).to eq('New Task')
        expect(task.description).to eq('New Description')
      end
    end

    context 'invalid attributes' do
      it 'does not updates task' do
        put :update, id: task, task: FactoryGirl.attributes_for(:task, title: nil, description: 'New Description')
        task.reload
        expect(task.title).to eq('Special Task')
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:task) { FactoryGirl.create(:task) }
    it 'deletes entry' do
      expect{
        delete :destroy, id: task
      }.to change(Task, :count).by(-1)
    end
  end
end
