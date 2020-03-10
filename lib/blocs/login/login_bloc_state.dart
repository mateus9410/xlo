enum LoginState { IDLE, LOADING, LOAD_FACE, ERROR, DONE }

class LoginBlocState {
  LoginBlocState(this.state, {this.errorMessage});

  LoginState state;
  String errorMessage;
}
