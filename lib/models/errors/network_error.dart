class NetworkError extends Error {
  final int status;
  final String msg;

  NetworkError({this.msg, this.status});

  @override
  String toString() => '$status | $msg';
}

class FetchDataError extends NetworkError {
  FetchDataError({status, msg})
      : super(status: status, msg: 'Fetching Data: $msg');
}

class BadRequestError extends NetworkError {
  BadRequestError({status, msg})
      : super(status: status, msg: 'Bad request: $msg');
}

class UnauthorisedError extends NetworkError {
  UnauthorisedError({status, msg})
      : super(status: status, msg: 'Unauthorized: $msg');
}

class InvalidInputError extends NetworkError {
  InvalidInputError({status, msg})
      : super(status: status, msg: 'Invalid input: $msg');
}
