import 'package:flutter/material.dart';

class FerryDetails extends StatelessWidget {
  final String from;
  final String to;
  final String fromDate;
  final String toDate;

  const FerryDetails({
    Key? key,
    required this.from,
    required this.to,
    required this.fromDate,
    required this.toDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    from,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              Text(
                fromDate,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                to,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                toDate,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
