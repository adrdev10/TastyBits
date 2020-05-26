import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tastybits/shoppingList.dart';

class ShoppingListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShoppingListWidgetState();
  }
}

class ShoppingListWidgetState extends State<ShoppingListWidget> {
  final ShoppingList _shoppingList = new ShoppingList();
  final _namecontroller = TextEditingController();
  var items = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _shoppingList.addItemToShoppingList(Item(name: 'milk'));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _namecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 120,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Shopping List',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
        // Container(
        //   width: double.infinity,
        //   height: 120,
        //   color: Colors.white,
        //   child: Image.asset(''),
        // ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          key: Key('e'),
          children: <Widget>[
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                    suffix: Padding(
                      padding: EdgeInsets.all(10),
                                          child: GestureDetector(
                        child: Text(
                          'ADD NEW ITEM',
                          style: TextStyle(
                            color: Colors.blue
                          ),
                          ),
                        onTap: () {
                          setState(() {
                            var itemName = _namecontroller.text;
                            if (itemName != null && itemName != '') {
                              Item item = Item(name: itemName);
                              _shoppingList.addItemToShoppingList(item);
                              items += 1;
                              print(_shoppingList.getItemName(items));
                              _namecontroller.clear();
                            } else {
                              return;
                            }
                          });
                        },
                      ),
                    ),
                    fillColor: Colors.white,
                    hintText: 'Add new item...',
                    prefixIcon: Padding(
                      padding: new EdgeInsets.symmetric(vertical: 0.0),
                      child: Icon(
                        Icons.search,
                      ),
                    )),
                style: TextStyle(),
                controller: _namecontroller,
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: _shoppingList.itemCount,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_shoppingList.getItemName(index)),
                  onTap: () => {},
                );
              }),
        )
      ],
    );
  }
}
