import 'package:shimmer_loading_effect/data/data.dart';

import '../models/food.dart';

class FoodRepository {
  Future<List<Food>> mockRequest() async => await Future.delayed(
        const Duration(seconds: 5),
        () => foodData,
      );
}