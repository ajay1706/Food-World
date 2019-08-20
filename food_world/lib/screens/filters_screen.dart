import 'package:flutter/material.dart';
import 'package:food_world/widgets/main_drawer.dart';


class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;


  final Map<String,bool> currentFilters;
  FiltersScreen(this.currentFilters,this.saveFilters);




  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;


  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarain'];


   super.initState();
  } // ignore: missing_return
  Widget _buildSwitchList(String title, String subTitle,bool currentValue,Function updateValue){
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
        actions: <Widget>[

          IconButton(icon: Icon(Icons.save),onPressed:(){

final selectedFilters = {
  'gluten':_glutenFree,
  'lactose':_lactoseFree,
  'vegan':_vegan,
  'vegetarian':_vegetarian
};
      widget.saveFilters(selectedFilters);
          }
          )
        ],
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

             _buildSwitchList("Gluten-free", "Only Gluten-free meals. ", _glutenFree,
                 (newValue){
               setState(() {
                 _glutenFree=newValue;
               });
                 }),
                _buildSwitchList("Lactose-free", "Only Lactose-free meals. ", _lactoseFree,
                        (newValue){
                      setState(() {
                        _lactoseFree=newValue;
                      });
                    }),
                _buildSwitchList("Vegetarian", "Only Vegetarian meals. ", _vegetarian,
                        (newValue){
                      setState(() {
                        _vegetarian=newValue;
                      });
                    }),
                _buildSwitchList("Vegan", "Only Vegan meals. ", _vegan,
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
