import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nayurveda_app/core/constant/sizes.dart';

class TreatMentListWidget extends StatelessWidget {
  final String ?name;
  final String ?maleCount;
 final String?femaleCoun;
  const TreatMentListWidget({super.key,this.femaleCoun,this.maleCount,this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.only(top: 10,bottom: 10),
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(217, 217, 217, 0.25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('1.'),
                kWidth14,
                Expanded(
                  child: Row(
                    children: [
                       Expanded(
                        child: Text(
                         name??"",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SvgPicture.asset(
                          'assets/images/carbon_close-filled (1).svg')
                    ],
                  ),
                ),
              ],
            ),
            kHeight10,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text('Male'),
                      kWidth10,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        height: 26,
                        width: 44,
                        child:  Center(child: Text(maleCount??"")),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Female'),
                      kWidth10,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        height: 26,
                        width: 44,
                        child:  Center(child: Text(femaleCoun??'')),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                      'assets/images/material-symbols_edit-outline.svg')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
