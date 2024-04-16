part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationUserChanged extends AuthenticationEvent{
  final MyUserModel myUserModel;
  const AuthenticationUserChanged(this.myUserModel);
}

class AuthenticationLogOutRequested extends AuthenticationEvent{}
