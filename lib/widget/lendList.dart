import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tong_tong/model/user.dart';
import 'package:tong_tong/widget/lendTile.dart';

class LendList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final group = Provider.of<List<GroupData>>(context, listen: true);
    print('This is' + group.length.toString());
    return ListView.builder(
      shrinkWrap: true,
      itemCount: group.length,
      itemBuilder: (context, index) {
        return LoanTile(
          group: group[index],
        );
      },
    );
  }
}
