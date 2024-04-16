part of 'challenges_bloc.dart';

class ChallengesState {
  final ChallengesModel challengesModel;
  final bool isDone ;

  ChallengesState({required this.isDone , required this.challengesModel,});

    ChallengesState copyWith({String? challenge_name,String? challenge_discreption,int? challenge_score , bool? isDone}){
      return ChallengesState(challengesModel: this.challengesModel.copyWith(challenge_name:  challenge_name,challenge_discreption: challenge_discreption,challenge_score: challenge_score), isDone: isDone ?? this.isDone);
    }
  
}
