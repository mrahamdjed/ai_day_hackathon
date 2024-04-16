class TeamModel {

  final String team_id;
  final String created_by_id;
  final String team_name;
  final String team_discreption;
  final int score;

  const TeamModel({
    required this.team_id,
    required this.created_by_id,
    required this.team_name,
    required this.team_discreption,
    required this.score,
  });

  static TeamModel fromMap(Map teamMap){
    return TeamModel(
      team_id: teamMap["team_id"], 
      created_by_id: teamMap["created_by_id"], 
      team_name: teamMap["team_name"], 
      team_discreption: teamMap["team_discreption"],
      score: teamMap["score"],
    );
  }
}