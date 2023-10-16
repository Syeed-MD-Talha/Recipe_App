import 'package:flutter/material.dart';
import 'recipe.dart';
import 'package:recipe_app/recipe_detail.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator', // Set the app title here
      theme: ThemeData(
        primaryColor: Colors.black, // Set the primary color to white
        appBarTheme: AppBarTheme(
          backgroundColor:
              Colors.white, // Set the app bar background color to white
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.black, // Your accent color
        ),
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black), // Set text color to black
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: Recipe.samples.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RecipeDetail(recipe: Recipe.samples[index])));
            },
            child: buildRecipeCard(Recipe.samples[index]),
          );
        },
      )),
    );
  }
}

Widget buildRecipeCard(Recipe recipe) {
  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image(image: AssetImage(recipe.imageUrl)),
          SizedBox(
            height: 14.0,
          ),
          Text(
            recipe.label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Platino',
            ),
          )
        ],
      ),
    ),
  );
}
