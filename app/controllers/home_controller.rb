class HomeController < ApplicationController
  # before_action :check_sign_in
  def home
  end

  def show
  end

  def add_member
    name = params[:name]
    employee_id = params[:employee_id]
    ref_employee = params[:ref_employee]
    code = params[:code]
    team = params[:team]
    Member.add_member(name,employee_id,ref_employee,code,team)
    render json: {'created': 'created'}
  end

  def add_team
    name = params[:name]
    colour = params[:colour]
    total_members = params[:total_members]
    Team.add_team(name,colour,total_members)
    render json: {'created': 'created'}
  end

  def teams
    @show_form = false
    @teams = Team.all
  end

  def team_details
    team_id = params[:teamId]
    team_dict = {}
    team = Team.find_by_id(team_id)
    team_dict['team'] = team.get_team_details()
    team_dict['members'] = Member.found_members(team_id=team_id)
    render json: team_dict
  end

  def identify
    employee_id = 1049 #change to take employee id from login email
    ref_employee = params[:employee_id]
    code = params[:code]
    member = Member.find_by_employee_id(employee_id)
    response, status = member.identify(ref_employee)
    if status == 202
      flash[:notice] = response
    else
      flash[:alert] = response
    end
    redirect_to teams_path
  end

  def toast(type, text)
    flash[:toastr] = { type => text }
  end

end
