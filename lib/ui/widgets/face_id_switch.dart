

import 'package:cloud_craft_solution/domain/local_auth.config.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:cloud_craft_solution/ui/utils/common_widget.dart';
import 'package:flutter/material.dart';

class FaceIdSwitch extends StatefulWidget {
  const FaceIdSwitch({super.key});

  @override
  State<FaceIdSwitch> createState() => _FaceIdSwitchState();
}

class _FaceIdSwitchState extends State<FaceIdSwitch> {
  late Future<bool> faceId;

  @override
  void initState() {
    faceId = LoacalAuthConfig.getAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: faceId,
      builder: (context, snapshot) {
        return SizedBox(
          height: 40,
          child: Row(
            children: [
              Icon(
                snapshot.data ?? false ? Icons.lock : Icons.lock_open,
                size: 24,
                color: Colors.white,
              ),
              width_40,
              Text(
                'Face ID',
                style: semibold_18.copyWith(
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Switch(
                value: snapshot.data ?? false,
                onChanged: (isLock) {
                  setState(() {
                    if (isLock == true) {
                      LoacalAuthConfig.seveAuth();
                      faceId = LoacalAuthConfig.getAuth();
                    }
                    if (isLock == false) {
                      LoacalAuthConfig.deleteAuth();
                      faceId = LoacalAuthConfig.getAuth();
                    }
                  });
                },
                activeTrackColor: primariBlue,
                inactiveTrackColor: Colors.grey[400],
              ),
              width_16,
            ],
          ),
        );
      },
    );
  }
}


