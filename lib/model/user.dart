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

  GroupData({this.id, this.groupname, this.imgurl, this.tax});
}
