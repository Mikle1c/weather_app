import 'package:flutter_test/flutter_test.dart';
import 'package:weather/helpers.dart';
import 'package:weather/utilities/constants.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('secret loader', () {
    test('check file', () {
      final secretKey = SecretLoader(secretPath: secretPath);
      secretKey.load();
      expect(secretKey.secretPath.isNotEmpty, true);
    });

    test('check file', () async {
      final citiesData = SecretLoader(secretPath: citiesPath);

      final json = await citiesData.loadCities();

      expect(json.isNotEmpty, true);
    });
  });
}
