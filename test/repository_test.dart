import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vehicle/config/di.dart';
import 'package:vehicle/models/coordinate_model.dart';
import 'package:vehicle/repository/rest_client.dart';

void main() {
  setUpAll(() async {
    await dotenv.load(fileName: ".env");
    setupGetIt();
  });

  group('Parking Repository', () {   
    test('findByCoordinate', () async {      
      final res = await getIt<RestClient>().findByCoordinate(
          const RequestCoordinateModel(
              latitude_bound: [36.015056, 37.1241231],
              longitude_bound: [127.394592, 128.34234]));

      expect(res.length, 633);
      expect(res[0].prkplceNo, '276-2-000008');
    });
  });
}
