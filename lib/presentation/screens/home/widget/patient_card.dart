
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nayurveda_app/core/constant/color.dart';
import 'package:nayurveda_app/core/constant/sizes.dart';
import 'package:nayurveda_app/presentation/widgets/text/text_utils.dart';

class PatientCard extends StatelessWidget {
  const PatientCard(
      {super.key,
      required this.regId,
      required this.address,
      required this.date,
      required this.name,
      required this.userName});
  final int regId;
  final String name;
  final String address;
  final String date;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        height: 166,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffF1F1F1)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        regId.toString(),
                        style:  TextUtils.theme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: kBlack),
                      ),
                      kWidth10,
                      Text(name,
                          style:  TextUtils.theme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: kBlack))
                    ],
                  ),
                  kHeight10,
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      address,
                      style:TextUtils.theme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: primaryColor),
                    ),
                  ),
                  kHeight10,
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/images/uil_calender.svg'),
                        kWidth14,
                        Text(date),
                        kWidth20,
                        SvgPicture.asset('assets/images/f7_person-2.svg'),
                        kWidth20,
                        Text(userName)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('View Booking details'),
                kWidth14,
                Icon(
                  Icons.arrow_forward_ios,
                  color: primaryColor,
                )
              ],
            )
          ],
        ));
  }
}
