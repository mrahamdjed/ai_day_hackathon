part of 'authentication_bloc.dart';

enum AuthenticationStatus {authenticated, unauthenticated , unknown}

class AuthenticationState extends Equatable {
  final AuthenticationStatus authenticationStatus;
  final MyUserModel? myUserModel;
  
  // ! Private Constructor
  const AuthenticationState._({this.authenticationStatus = AuthenticationStatus.unknown , this.myUserModel});

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(MyUserModel myUserModel) : this._(authenticationStatus: AuthenticationStatus.authenticated , myUserModel: myUserModel);
  
  const AuthenticationState.unauthenticated() : this._(authenticationStatus: AuthenticationStatus.unauthenticated);

  
  @override
  List<Object?> get props => [authenticationStatus,myUserModel];
}