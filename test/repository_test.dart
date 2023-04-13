import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:vehicle/models/coordinate_model.dart';
import 'package:vehicle/repository/home_repository.dart';


void main() async {
  await dotenv.load(fileName: ".env");
  Get.lazyPut<HomeRepository>(() => HomeRepository());
  final homeRepository = Get.find<HomeRepository>();


  group('Parking Repository', () {
    test('findByCoordinate', () async {
      final res = await homeRepository.findByCoordinate({
        'latitude_bound': [36.015056, 37.1241231],
        'longitude_bound': [127.394592, 128.34234]
      });

      final dataList = res.body
          .map((data) => ResponseCoordinateModel.fromJson(data))
          .toList();
    
      expect(dataList.length, 633);
      expect(dataList[0].prkplceNo, '276-2-000008');
    });
  });
}
