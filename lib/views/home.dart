import 'package:apitest/models/recipeapimodel.dart';
import 'package:apitest/models/recipemodel.dart';
import 'package:apitest/views/widgets/recipe.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();

    getRecipies();
  }

  Future<void> getRecipies() async {
    _recipes = await RecipeApi.getRecipe();

    setState(() {
      _isLoading = false;
    });

    print(_recipes);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text("Food Recipe"),
            ],
          ),
        ),
        body: RecipeCard(
            title: "title",
            cookTime: "cookTime",
            rating: "rating",
            thumbnailUrl:
                "https://images.unsplash.com/photo-1611095562057-2e70d5bf9dee?ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8dGVjaG5vbG9neXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"));
  }
}
