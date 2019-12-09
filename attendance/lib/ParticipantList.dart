import 'package:flutter/material.dart';
import 'EventCard.dart';
import 'media.dart';
class ParticipantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EventCards(CardVals: ParticipantPageList);
  }
}