import 'package:bloc/bloc.dart';
import 'package:problem_solving_platform/backend/challenges/challenges_repository/challenges_repository.dart';
import 'package:problem_solving_platform/backend/challenges/challenges_repository/model/challenges_model.dart';

part 'challenges_event.dart';
part 'challenges_state.dart';

class ChallengesBloc extends Bloc<ChallengesEvent, ChallengesState> {
  final ChallengesRepository challengesRepository = ChallengesRepository();

  ChallengesBloc(ChallengesModel challengesModel) : super(ChallengesState(challengesModel: challengesModel, isDone: false)) {

    on<AddAnswer>((event, emit) {
      challengesRepository.addAnswer(challengesModel.challenge_id, event.answerUrl,event.user_id);
      emit(state.copyWith(isDone: true));
    });
  
  }
}
