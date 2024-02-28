import 'package:cloud_craft_solution/domain/models/reservation_date_model.dart';
import 'package:cloud_craft_solution/domain/models/room_model.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/widgets/bottom_sheet_room_info.dart';
import 'package:flutter/material.dart';

class ChooseRoomCard extends StatelessWidget {
  final RoomModel room;
  final ReservatiDateModel reservatiDateModel;
  const ChooseRoomCard(
      {super.key, required this.room, required this.reservatiDateModel});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return BottomSheetRoomInfo(
                room: room,
                dateEnd: reservatiDateModel.dateEnd ,
                dateStart: reservatiDateModel.dateStart,
              );
            },
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha(100),
                  offset: const Offset(0, 2),
                  blurRadius: 16)
            ],
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Image.network(
                  room.linkImage,
                  //'https://cdn.mep.agency/prod/creasystem/uploads/1edf5be7-404a-641c-b41d-2bbb2e286b83/Prenota%20una%20sala%20meeting-compressed.jpg',
                  fit: BoxFit.cover,
                  height: 140,
                  width: 136,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.blueGrey.shade900,
                      height: 140,
                      width: 136,
                      child: const Icon(
                        Icons.meeting_room,
                        color: Colors.white,
                        size: 48,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      room.name,
                      style: bold_20,
                      maxLines: 3,
                    ),
                    SizedBox(
                      width: constraint.maxWidth - 154,
                      child: Text(
                        room.description,
                        style: semibold_14,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.person),
                        Text('x ${room.seats}')
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
