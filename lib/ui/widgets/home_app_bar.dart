import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Builder(
              builder: (context) => GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(24)),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1511367461989-f85a21fda167?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Riccardo Ferrero",
                  style: bold_16,
                ),
                Text(
                  "Bentornato!",
                  style: semibold_14,
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
