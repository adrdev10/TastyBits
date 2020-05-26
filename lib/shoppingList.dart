class ShoppingList {
  final List<Item> items = [];

  //Get items length
  int get itemCount => items.length;

//Add item from shopping list and return the new shopping list
  void addItemToShoppingList(Item item) {
    this.items.add(item);
  }

  String getItemName(index) => items[index].name;

//Delete item from shopping list and return the shopping list
  void  deleteItemFromShoppingList(Item item) {
    bool canRemoved;
    canRemoved = items.remove(item);
    if (!canRemoved){
      throw new Exception('Item not found');
    }
  }
}


class Item {
  final String name;
  Item({this.name});
}