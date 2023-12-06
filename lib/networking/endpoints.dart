mixin Endpoints {
  static const String baseUrl = 'http://192.168.1.60:44301/ProductionPartRealization/';
}

class AuthenticationEndpoints with Endpoints {
  static const String _prefix = 'Authentication.asmx';
  static const String login = '$_prefix/Login';
}

class WorkPlanEndpoints with Endpoints {
  static const String _prefix = 'WorkPlan.asmx';
  static const String getProjects = '$_prefix/projects';
}

class PartOperationsEndpoints with Endpoints {
  static const String _prefix = 'PartOperations.asmx';
  static const String getProjects = '$_prefix/projects';
}