import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget{
  const MealItem({super.key, required this.meal, required this.displayMealDetails});
  final Meal meal;
  final Function() displayMealDetails;

  @override
  Widget build(BuildContext context) =>
  Card(
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15)
    ),
    // apply contents to have the border
    clipBehavior: Clip.hardEdge,
    // 3D effect-shadow
    elevation: 2,
    child: InkWell(
      onTap: () => displayMealDetails(),
      child: Stack(
        children: [
          Hero(
            tag: meal.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage), 
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
              ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black54,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
              child: Column(
                children: [
                  Text(
                    meal.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MealItemTrait(icon: Icons.timelapse, label: "${meal.duration} mins"),
                      const SizedBox(width: 20,),
                      MealItemTrait(icon: Icons.work, 
                      label: meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1),),
                      const SizedBox(width: 20,),
                      MealItemTrait(icon: Icons.attach_money, 
                      label: meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1),),
                    ],
                  )
                ],
              ),
            )),
        ],
      ),
    )
  );
}