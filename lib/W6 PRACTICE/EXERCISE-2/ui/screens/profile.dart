import 'package:flutter/material.dart';
import '../../model/profile_tile_model.dart';
import '../theme/theme.dart';

class ProfileApp extends StatelessWidget {
  final ProfileData profileData;

  const ProfileApp({super.key, required this.profileData});

  List<ProfileTile> getwidget() {
    return profileData.tiles.map((e) {
      return ProfileTile(icon: e.icon, title: e.title, data: e.value);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.withAlpha(100),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/avatars/Jacob.png'),
            ),
            const SizedBox(height: 20),
            Text(
              profileData.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            Text(
              profileData.position,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ...getwidget(),

            // ListView(
            //   shrinkWrap: true,
            //   children: [
            //     for (int i = 0 ; i < profileData.tiles.length ; i ++ )
            //     ProfileTile(
            //       icon: profileData.tiles[i].icon,
            //       title:profileData.tiles[i].title,
            //       data: profileData.tiles[i].value,
            //     ),

            //   ],
            // )
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: profileData.tiles.length,
            //     itemBuilder: (context, index) {
            //       final tile = profileData.tiles[index];
            //       return ProfileTile(
            //         icon: tile.icon,
            //         title: tile.title,
            //         data: tile.value,
            //       );

            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: AppColors.primary),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
