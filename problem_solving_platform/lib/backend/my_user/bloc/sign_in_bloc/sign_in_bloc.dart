import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:problem_solving_platform/backend/my_user/user_repository/models/my_user_model.dart';
import 'package:problem_solving_platform/backend/my_user/user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository userRepository;

  SignInBloc(this.userRepository) : super(SignInInitial()) {

    on<SignInRequired>((event, emit) async {
      
      emit(SignInProcess());
      
      try {
       final MyUserModel temp = await userRepository.signIn(event.email,event.password); 
       if(temp.isEmpty){
        emit(const SignInFailure());
       }else{
        emit(SignInSuccess());
       }

      } catch (e) {
        emit(const SignInFailure());
      }
    });

  }
}
