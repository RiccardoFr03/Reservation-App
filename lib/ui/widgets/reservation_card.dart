import 'package:cloud_craft_solution/domain/models/user_reservation_model.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:cloud_craft_solution/ui/widgets/modals/delete_modal.dart';
import 'package:cloud_craft_solution/ui/widgets/modals/edit_modal.dart';
import 'package:cloud_craft_solution/ui/widgets/modals/end_modal.dart';
import 'package:cloud_craft_solution/ui/widgets/reservation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ReservationCard extends StatefulWidget {
  final UserReservationModel reservation;
  final VoidCallback update;
  const ReservationCard(
      {super.key, required this.reservation, required this.update});

  @override
  State<ReservationCard> createState() => _ReservationCardState();
}

class _ReservationCardState extends State<ReservationCard> {
  @override
  Widget build(BuildContext context) {
    return widget.reservation.dateTimeStart.isBefore(DateTime.now()) &&
            widget.reservation.dateTimeEnd.isAfter(DateTime.now())
        ? Slidable(
            key: const ValueKey(0),
            endActionPane: ActionPane(
                extentRatio: 0.3,
                dragDismissible: false,
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: [
                  CustomSlidableAction(
                    onPressed: (BuildContext context) => showDialog(
                      context: context,
                      builder: (BuildContext context) => EndModal(
                        reservation: widget.reservation,
                        update: widget.update,
                      ),
                    ),
                    backgroundColor: primariBlue,
                    borderRadius: BorderRadius.circular(24),
                    child: const Icon(
                      Icons.check,
                      size: 36,
                      color: Colors.black,
                    ),
                  ),
                ]),
            child: ReservationWidget(
                update: widget.update, reservation: widget.reservation),
          )
        : widget.reservation.dateTimeStart.isAfter(DateTime.now())
            ? Slidable(
                key: const ValueKey(0),
                endActionPane: ActionPane(
                    extentRatio: widget.reservation.isDesk == true ? 0.3 : 0.6,
                    dragDismissible: false,
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(onDismissed: () {}),
                    children: [
                      CustomSlidableAction(
                        onPressed: (BuildContext context) => showDialog(
                          context: context,
                          builder: (BuildContext context) => DeleteModal(
                            reservation: widget.reservation,
                            update: widget.update,
                          ),
                        ),
                        backgroundColor: Colors.red,
                        borderRadius: BorderRadius.circular(24),
                        child: const Icon(
                          Icons.delete,
                          size: 36,
                          color: Colors.black,
                        ),
                      ),
                      Visibility(
                        visible:
                            widget.reservation.isDesk == true ? false : true,
                        child: CustomSlidableAction(
                          onPressed: (BuildContext context) => showDialog(
                            context: context,
                            builder: (BuildContext context) => EditModal(
                              reservation: widget.reservation,
                              update: widget.update,
                            ),
                          ),
                          backgroundColor: primaryOrange,
                          borderRadius: BorderRadius.circular(24),
                          child: const Icon(
                            Icons.edit,
                            size: 36,
                          ),
                        ),
                      ),
                    ]),
                child: ReservationWidget(
                    update: widget.update, reservation: widget.reservation),
              )
            : widget.reservation.dateTimeEnd.isBefore(DateTime.now())
                ? ReservationWidget(
                    update: widget.update, reservation: widget.reservation)
                : Container();
  }
}
