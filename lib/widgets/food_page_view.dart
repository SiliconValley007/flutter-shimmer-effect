import 'package:flutter/material.dart';
import 'package:shimmer_loading_effect/widgets/custom_shimmer.dart';

import '../models/food.dart';

class FoodPageView extends StatefulWidget {
  const FoodPageView(
      {Key? key, required this.foodItems, this.isLoading = false})
      : super(key: key);

  final List<Food> foodItems;
  final bool isLoading;

  @override
  _FoodPageViewState createState() => _FoodPageViewState();
}

class _FoodPageViewState extends State<FoodPageView> {
  List<Food> get _foodItems => widget.foodItems;
  bool get _isLoading => widget.isLoading;

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            24.0,
            60.0,
            24.0,
            4.0,
          ),
          child: _isLoading
              ? CustomShimmer(
                  child: Container(
                    height: 32.0,
                    width: 100.0,
                    color: Colors.grey.shade300,
                  ),
                )
              : const Text(
                  'Most Popular',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
        SizedBox(
          height: 200.0,
          child: _isLoading
              ? PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (_, __) {
                    return CustomShimmer(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 8.0,
                        ),
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : PageView.builder(
                  controller: _pageController,
                  itemCount: _foodItems.length,
                  itemBuilder: (context, index) {
                    final food = _foodItems[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 8.0,
                      ),
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        image: DecorationImage(
                          image: NetworkImage(food.imageURL),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
