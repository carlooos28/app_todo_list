class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    resource['group_id'] = params['user'][:group_id]
    resource.save
    render json: resource, status: :created
  end
end