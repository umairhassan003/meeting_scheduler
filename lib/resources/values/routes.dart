enum Routes {
  sample,
}

extension StaticRoutes on Routes {
  static const _routeModel = {
    Routes.sample: "/sample",
  };

  String get url => _routeModel[this] ?? "";
}
