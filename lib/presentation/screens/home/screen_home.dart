import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nayurveda_app/application/home/home_state.dart';
import 'package:nayurveda_app/core/constant/color.dart';
import 'package:nayurveda_app/core/constant/demo.dart';
import 'package:nayurveda_app/core/constant/sizes.dart';
import 'package:nayurveda_app/core/routes/routes.dart';
import 'package:nayurveda_app/domain/models/home/home_response.dart';
import 'package:nayurveda_app/presentation/screens/home/widget/patient_card.dart';
import 'package:nayurveda_app/presentation/widgets/appbar/appbar.dart';
import 'package:nayurveda_app/presentation/widgets/buttons/custom_material_button.dart';
import 'package:nayurveda_app/presentation/widgets/date_picker/date_picker.dart';
import 'package:nayurveda_app/presentation/widgets/dropdown/common_dropdown.dart';
import 'package:nayurveda_app/presentation/widgets/padding/main_padding.dart';
import 'package:nayurveda_app/presentation/widgets/text/text_utils.dart';
import 'package:nayurveda_app/presentation/widgets/text_fields/text_field_widget.dart';
import 'package:nayurveda_app/provider/home/home_provider.dart';
import 'package:nayurveda_app/provider/register/register_provider.dart';

class ScreenHome extends ConsumerStatefulWidget {
  const ScreenHome({super.key});

  @override
  ConsumerState<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends ConsumerState<ScreenHome> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(HomeProvider.homeProvider.notifier).loadPatientsLists();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: SizedBox(
          width: 350,
          child: CustomMaterialBtton(
            buttonText: 'Register Now',
            onPressed: () {
              ref.read(RegisterProvider.branch);
              Navigator.pushNamed(context, register);
            },
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: const AppbarWidget(),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          MainPadding(
            child: Row(
              children: [
                Flexible(
                  child: TextFeildWidget(
                    hintText: 'Search for treatments',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 28,
                    ),
                    borderColor: Colors.grey,
                    
                  ),
                ),
                kWidth10,
                Container(
                  height: 40,
                  width: 85.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: primaryColor),
                  child: const Center(
                      child: Text(
                    'Search',
                    style: TextStyle(color: Colors.white),
                  )),
                )
              ],
            ),
          ),
          kHeight28,
          MainPadding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sort By :',
                  style: TextUtils.theme.titleSmall?.copyWith(
                      color: kBlack54,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
                SizedBox(
                    width: 169,
                    child: CommonDropdown(
                      radius: 24,
                      dropDownValue: CommonFunction().date,
                      hintText: 'Date',
                      onChanged: (v) {},
                    ))
              ],
            ),
          ),
          kHeight20,
          Divider(
            color: Colors.grey.shade300,
          ),
          MainPadding(
            child: Consumer(
              builder: (context, ref, child) {
                final HomeState state = ref.watch(HomeProvider.homeProvider);
                List<PatientLists> patientList = state.patientList ?? [];
                return state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: patientList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = patientList[index];
                          return PatientCard(
                            regId: int.parse(data.id.toString()),
                            address: data.address ?? '',
                            date: apiFormat
                                .format(data.dateNdTime ?? DateTime.now()),
                            name: data.name ?? '',
                            userName: data.user ?? '',
                          );
                        },
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
