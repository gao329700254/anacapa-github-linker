require 'slack-ruby-bot-server'

class SlackWorkspacesController < ApplicationController
  before_action :set_slack_workspace, only: [:show, :edit, :update, :destroy]

  # GET /slack_workspaces
  # GET /slack_workspaces.json
  def index
    @slack_workspaces = SlackWorkspace.all
  end

  # GET /slack_workspaces/1
  # GET /slack_workspaces/1.json
  def show
  end

  # GET /slack_workspaces/new
  def new
    @slack_workspace = SlackWorkspace.new
  end

  def auth_callback
    client = Slack::Web::Client.new
    rc = client.oauth_access(
        client_id: ENV['SLACK_CLIENT_ID'],
        client_secret: ENV['SLACK_CLIENT_SECRET'],
        code: params[:code])
    redirect_to root_path
  end

  # GET /slack_workspaces/1/edit
  def edit

  end

  # POST /slack_workspaces
  # POST /slack_workspaces.json
  def create
    @slack_workspace = SlackWorkspace.new(slack_workspace_params)

    respond_to do |format|
      if @slack_workspace.save
        format.html { redirect_to @slack_workspace, notice: 'Slack workspace was successfully created.' }
        format.json { render :show, status: :created, location: @slack_workspace }
      else
        format.html { render :new }
        format.json { render json: @slack_workspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slack_workspaces/1
  # PATCH/PUT /slack_workspaces/1.json
  def update
    respond_to do |format|
      if @slack_workspace.update(slack_workspace_params)
        format.html { redirect_to @slack_workspace, notice: 'Slack workspace was successfully updated.' }
        format.json { render :show, status: :ok, location: @slack_workspace }
      else
        format.html { render :edit }
        format.json { render json: @slack_workspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slack_workspaces/1
  # DELETE /slack_workspaces/1.json
  def destroy
    @slack_workspace.destroy
    respond_to do |format|
      format.html { redirect_to slack_workspaces_url, notice: 'Slack workspace was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slack_workspace
      @slack_workspace = SlackWorkspace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slack_workspace_params
      params.fetch(:slack_workspace, {})
    end
end
