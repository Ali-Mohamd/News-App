abstract class newsStates {}

class initialState extends newsStates {}

class btmNavState extends newsStates {}

class BloadingState extends newsStates {}
class getBusinessTrue extends newsStates {}
class getBusinessError extends newsStates {
  final String error;
  getBusinessError(this.error);
}

class sportsloadingState extends newsStates {}
class getSportsTrue extends newsStates {}
class getSportsError extends newsStates {
  final String error;
  getSportsError(this.error);
}

class scienceloadingState extends newsStates {}
class getscienceTrue extends newsStates {}
class getscienceError extends newsStates {
  final String error;
  getscienceError(this.error);
}

