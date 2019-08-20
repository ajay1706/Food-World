import 'package:flutter/material.dart';
import 'package:food_world/widgets/main_drawer.dart';


class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;


  // ignore: missing_return
  Widget buildSwitchList(String title, String subTitle,bool currentValue,Function updateValue){
   return SwitchListTile(
        title: Text(
       title
    ),
    value: currentValue,
    subtitle: Text(subTitle),
    onChanged: updateValue,);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selections',
              style:Theme.of(context).textTheme.title

            ),
          )
          ,
          Expanded(
            child: ListView(
              children: <Widget>[

             buildSwitchList("Gluten-free", "Only Gluten-free meals. ", _glutenFree,
                 (newValue){
               setState(() {
                 _glutenFree=newValue;
               });
                 }),
                buildSwitchList("Lactose-free", "Only Lactose-free meals. ", _lactoseFree,
                        (newValue){
                      setState(() {
                        _lactoseFree=newValue;
                      });
                    }),
                buildSwitchList("Vegetarian", "Only Vegetarian meals. ", _vegetarian,
                        (newValue){
                      setState(() {
                        _vegetarian=newValue;
                      });
                    }),
                buildSwitchList("Vegan", "Only Vegan meals. ", _vegan,
                        (newValue){
                      setState(() {
                        _vegan=newValue;
                      });
                    })
              ],
            ),
          )
        ],
      )
    );
  }
}
