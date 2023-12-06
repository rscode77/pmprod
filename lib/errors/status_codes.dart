class StatusCodes {
  static const int success = 200;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int userNotRegistered = 409;

  const StatusCodes._();

  static bool isError(int? statusCode) => statusCode == null ? false : statusCode >= 400 && statusCode < 500;

  static bool isSuccess(int? statusCode) => statusCode == null ? false : statusCode >= 200 && statusCode < 300;

  static bool isUnauthorizedError(int? statusCode) => statusCode == null ? false : statusCode == unauthorized;

  static bool isUserNotRegistered(int? statusCode) => statusCode == userNotRegistered;
}
