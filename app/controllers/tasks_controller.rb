class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]
  after_action :filter_type_share, only: [:create]

  # GET /tasks
  def index
    @tasks = Task.all

    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
  end

  def task_list_by_group
    group_id = params[:group_id]

    if group_id.present?
      tasks = ShareItemGroup.where(group_id: group_id)
      render json: tasks
    end
  end

  def task_list_by_user
    user_id = params[:user_id]

    if user_id.present?
      tasks = ShareItemUser.where(user_id: user_id)
      render json: tasks
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :description, :initial_date, :final_date, :status, :type_share_item, :user_id)
    end

  def filter_type_share
    type_share_item = params[:type_share_item].present? ? params[:type_share_item] : :not_shared
    p type_share_item
    case type_share_item
    when 1
      ShareItemGroup.create(group_id: @task.user.group_id, task_id: @task.id)
    when 2
      ShareItemUser.create(task_id: @task.id, user_id: @task.user.id)
    else
      "DEFAULT"
    end
  end
end
