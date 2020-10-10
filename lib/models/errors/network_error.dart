class InvalidArgsError extends Error {
  final String msg;
  final String fromError;

  InvalidArgsError({this.msg, this.fromError});

  @override
  String toString() => msg;
}

class NetworkError extends Error {
  final int status;
  final String msg;
  final String fromError;

  NetworkError({this.msg, this.status, this.fromError});

  @override
  String toString() => msg;
}

class FetchDataError extends NetworkError {
  FetchDataError({status, msg})
      : super(status: status, msg: msg, fromError: 'Fetching Data');
}

class BadRequestError extends NetworkError {
  BadRequestError({status, msg})
      : super(status: status, msg: msg, fromError: 'Bad request');
}

class UnauthorisedError extends NetworkError {
  UnauthorisedError({status, msg})
      : super(status: status, msg: msg, fromError: 'Unauthorized');
}

class InvalidInputError extends NetworkError {
  InvalidInputError({status, msg})
      : super(status: status, msg: msg, fromError: 'Invalid input');
}
