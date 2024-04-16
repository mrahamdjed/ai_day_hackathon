import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:problem_solving_platform/backend/my_user/user_repository/models/my_user_model.dart';
import 'package:problem_solving_platform/backend/my_user/user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UserRepository userRepository;
  late final StreamSubscription<MyUserModel?> _userSub;

  AuthenticationBloc(this.userRepository) : super(const AuthenticationState.unknown()) {

    _userSub = userRepository.userStream.stream.listen((user) { 
      print("PPPPPPPPPPPPPPPPPPPPPPPPPP $user");
      add(AuthenticationUserChanged(user));
    });

    on<AuthenticationUserChanged>(
      (event, emit){
        if( event.myUserModel.isEmpty ==  false){
          emit(AuthenticationState.authenticated(event.myUserModel));
          print("=======================00000000=============+=====++");
        }
        else {
          emit(const AuthenticationState.unauthenticated());
          print("====================================+=====++");
        }

      }
    );
  }

  @override
  Future<void> close() {
    _userSub.cancel();
    return super.close();
  }
}
