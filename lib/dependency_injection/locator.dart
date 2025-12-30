/// Simple service locator for dependency injection
class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();

  factory ServiceLocator() {
    return _instance;
  }

  ServiceLocator._internal();

  /// Initialize all services and dependencies
  void servicesLocator() {
    // TODO: Register your services here
    // Example:
    // getIt.registerSingleton<UserRepository>(UserRepositoryImpl());
    // getIt.registerSingleton<UserBloc>(UserBloc(getIt()));
  }
}
