import 'package:flutter/material.dart';
import 'package:shimmer_loading_effect/repositories/food_repository.dart';
import 'package:shimmer_loading_effect/widgets/food_list_view.dart';
import 'package:shimmer_loading_effect/widgets/food_page_view.dart';

import 'models/food.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Shimmer',
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FoodRepository().mockRequest(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final foodItems = snapshot.data as List<Food>;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: FoodPageView(
                    foodItems: foodItems,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Divider(
                    indent: 12.0,
                    endIndent: 12.0,
                  ),
                ),
                FoodListView(
                  foodItems: foodItems,
                ),
              ],
            );
          }
          return const CustomScrollView(
            physics: NeverScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: FoodPageView(
                  foodItems: [],
                  isLoading: true,
                ),
              ),
              SliverToBoxAdapter(
                child: Divider(
                  indent: 12.0,
                  endIndent: 12.0,
                ),
              ),
              FoodListView(
                foodItems: [],
                isLoading: true,
              ),
            ],
          );
        },
      ),
    );
  }
}
