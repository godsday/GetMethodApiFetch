import 'package:flutter/material.dart';

class UserTileWidget extends StatelessWidget {
  final String avatar;
  final String name;
  final String email;

  const UserTileWidget({
    super.key,
    required this.avatar,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius:BorderRadius.circular(100.0),
        child: FadeInImage(
          placeholder: const AssetImage('assets/man.png'),
          image: NetworkImage(avatar),
          fit: BoxFit.cover,
        ),
      ),
      title: Text(name),
      subtitle: Text(email),
    );
  }
}
