import 'package:flutter/material.dart';
import 'package:shimmer_loading_effect/widgets/custom_shimmer.dart';

import '../models/food.dart';

class FoodListView extends StatelessWidget {
  const FoodListView({
    Key? key,
    required this.foodItems,
    this.isLoading = false,
  }) : super(key: key);

  final List<Food> foodItems;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, __) {
                return ListTile(
                  leading: CustomShimmer(
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  title: CustomShimmer(
                    child: Container(
                      height: 16.0,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  subtitle: CustomShimmer(
                    child: Container(
                      height: 16.0,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  trailing: CustomShimmer(
                    child: Container(
                      height: 24.0,
                      width: 24.0,
                      color: Colors.grey.shade300,
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
          )
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final food = foodItems[index];
                return ListTile(
                  leading: Image.network(
                    food.imageURL,
                    height: 60.0,
                    width: 60.0,
                    fit: BoxFit.cover,
                  ),
                  title: Text(food.name),
                  subtitle: Text('\$${food.price}'),
                  trailing: const Icon(Icons.chevron_right),
                );
              },
              childCount: foodItems.length,
            ),
          );
  }
}
