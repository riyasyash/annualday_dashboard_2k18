class Team < ApplicationRecord

    def self.add_team(name,colour,total_members)
        team = Team.new
        team.name = name
        team.total_members = total_members
        team.colour = colour
        team.members_found = 0
        team.position = nil
        team.save

    end
    def self.get_details()
      teams = Team.all()
      teams_list = []
      teams.each do |t|
        teams_list << t.get_team_details()
      end
      return teams_list
    end

    def get_team_details()
      team_dict = {}
      team_dict['name'] = self.name
      team_dict['colour'] = self.colour
      team_dict['position'] = self.position
      team_dict['progress'] = (self.members_found.to_f/self.total_members.to_f)*100
      return team_dict
    end

end
