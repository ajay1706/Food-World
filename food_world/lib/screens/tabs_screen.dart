import 'package:flutter/material.dart';
import 'package:food_world/models/meal.dart';
import 'package:food_world/screens/favourites_screen.dart';
import 'package:food_world/widgets/main_drawer.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

 List<Map<String, Object>>
 _pages ;

 int _selectedPageIndex = 0;
 @override
  void initState() {
   _pages = [
     {'page': CategoriesScreen(),
       'title':'Categories'},
     {'page':   FavoritesScreen(widget.favoriteMeals),
       'title':'Your Favourites'},

   ];
    // TODO: implement initState
    super.initState();
  }


  void _selectPage(int index){

    setState(() {
      _selectedPageIndex = index;

    });


  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(

          title: Text(_pages[_selectedPageIndex]['title']),

        ),
drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap:_selectPage ,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor:Colors.white ,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,

              icon: Icon(Icons.category),
            title: Text(
              'Categories'
            )
          ),

          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,

              icon: Icon(Icons.star),
              title: Text(
                  'Favourites'
              )
          ),
        ],



      ),
    );
}}
