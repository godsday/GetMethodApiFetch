import 'package:api_learning/api/api.dart';
import 'package:api_learning/models/useer_data_model.dart';
import 'package:api_learning/models/user_list_model.dart';
import 'package:api_learning/screens/widget/user_tile_widget.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<UserList>? _userData = [];
  bool _isLoading = true;
  // avoid usinng isLoading use Future builder instaed

  @override
  void initState() {
    _callUserListAPI();
    super.initState();
  }

  // if you are using state management this func will come inside
  // controller or view_model folder
  Future<void> _callUserListAPI() async {
    UserDataModel? response = await API().getUer();
    // if you have some parameter to pass to the api pass in getUser({name:'a'})
    if (response != null) {
      if (response.data != null) {
        setState(() {
          _userData = response.data ?? [];
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error from API'),
          ),
        );
        // show Error message from api
        // use your on way of showing aletrs
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No network Found!'),
        ),
      );
      // show network not available
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return UserTileWidget(
                  avatar: _userData?[index].avatar ?? '',
                  name: _userData?[index].firstName ?? '',
                  email: _userData?[index].email ?? '',
                );
              },
              separatorBuilder: (_, __) {
                return const Divider();
              },
              itemCount: _userData?.length ?? 0,
            ),
    );
  }
}
