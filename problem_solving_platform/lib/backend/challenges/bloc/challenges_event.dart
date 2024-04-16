part of 'challenges_bloc.dart';

abstract class ChallengesEvent {}

class AddAnswer extends ChallengesEvent{
  final String answerUrl;
  final String user_id;
  AddAnswer({required this.user_id, required this.answerUrl});
}