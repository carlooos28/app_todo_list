require 'rails_helper'

RSpec.describe GroupsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Group. As you add validations to Group, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryBot.attributes_for(:group)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GroupsController. Be sure to keep this updated too.
  let!(:user) { create(:user) }
  let!(:group) { create(:group) }
  let(:valid_session) { { 'Authorization' => "Bearer #{user.jti}" } }

  describe "GET #index" do
    it "returns a success response" do
      group = Group.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      group = Group.create! valid_attributes
      get :show, params: {id: group.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Group" do
        expect {
          post :create, params: {group: valid_attributes}, session: valid_session
        }.to change(Group, :count).by(1)
      end

      it "renders a JSON response with the new group" do

        post :create, params: {group: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(group_url(Group.last))
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryBot.attributes_for(:group)
      }

      it "updates the requested group" do
        group = Group.create! valid_attributes
        put :update, params: {id: group.to_param, group: new_attributes}, session: valid_session
        group.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end

      it "renders a JSON response with the group" do
        group = Group.create! valid_attributes

        put :update, params: {id: group.to_param, group: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested group" do
      group = Group.create! valid_attributes
      expect {
        delete :destroy, params: {id: group.to_param}, session: valid_session
      }.to change(Group, :count).by(-1)
    end
  end

end
