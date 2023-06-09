class Matches
  class << self
    def lambda
      ->(object) {
        team_id = Matches.team_id(object)
        unscope(:where).where('"team2_id" = ? or "team1_id" = ?', team_id, team_id)
      }
    end

    def team_id(object)
      object.try(:team_id) || object.id
    end
  end
end
