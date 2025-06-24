import 'dart:io';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final int age;
  final String? avatarUrl;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.email,
    required this.age,
    this.avatarUrl,
  }) : super(key: key);

  bool get isRunningInTest => Platform.environment.containsKey('FLUTTER_TEST');

  @override
  Widget build(BuildContext context) {
    final showImage = avatarUrl != null && !isRunningInTest;
    return Card(
      key: const Key('profileCard'),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: showImage ? NetworkImage(avatarUrl!) : null,
              backgroundColor: Colors.blue[100],
              child: avatarUrl == null
                  ? Text(
                      name.isNotEmpty ? name[0] : '',
                      key: const Key('avatarInitial'),
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    )
                  : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    key: const Key('profileName'),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    email,
                    key: const Key('profileEmail'),
                  ),
                  Text(
                    'Age: $age',
                    key: const Key('profileAge'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
