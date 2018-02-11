class Member < ApplicationRecord
    def self.add_member(name,employee_id,ref_employee,code,team)
        member = Member.new
        member.name=name
        member.employee_id=employee_id
        member.code=code
        member.ref_employee=ref_employee
        member.attempts=3
        member.is_identified=false
        member.team_id = team
        member.save
    end

    def self.found_members(team_id)
      found_members = Member.where("team_id = ? AND is_identified = ?",team_id,true)
      member_list = []
      found_members.each do |found_member|
        member_list << found_member.member_details
      end
      return member_list
    end

    def member_details()
      member_dict = {}
      member_dict['found_by'] = self.name
      member_dict['name'] = Member.find_by_employee_id(self.ref_employee).name
      return member_dict
    end

    def identify(ref_employee,code)
      unless self.attempts<1
        if self.ref_employee == ref_employee and self.code == code and self.is_identified == false
          self.is_identified = true
          team = Team.find_by_id(self.team_id)
          team.members_found = team.members_found+1
          if team.members_found == team.total_members
            team.position = Team.maximum("position")+1
          end
          team.save
          self.save
          return "identification succesful",202
        else
          self.attempts = self.attempts-1
          self.save
          return "identficatn failed,#{self.attempts} attempts left for the day", 403
        end
      end
      return "no remaining attempts",403
    end
end
