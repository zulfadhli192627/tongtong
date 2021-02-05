class User {
  final String email;

  User({this.email});
}

class UserData {
  final String email;
  final String picUrl;

  UserData({this.email, this.picUrl});
}

class Menu {
  final String name;
  final String price;

  Menu({this.name, this.price});
}

class GroupData {
  final String id;
  final String groupname;
  final String imgurl;
  final String tax;
  final List<Item> item;

  GroupData({this.id, this.groupname, this.imgurl, this.tax, this.item});
}

class Item {
  final String itemName;
  final String name;
  final String price;
  final String quantity;

  Item({this.itemName, this.name, this.price, this.quantity});
}
