part of util.system;

// 通过命令--dart-define=key=value
// flutter run --dart-define=APP_CHANNEL=ZeroFlutter --dart-define=ENV=dev
(String, String) getEnvironmentConfig() {
  const env = String.fromEnvironment('ENV');
  const channel = String.fromEnvironment('CHANNEL');

  return (env, channel);
}
