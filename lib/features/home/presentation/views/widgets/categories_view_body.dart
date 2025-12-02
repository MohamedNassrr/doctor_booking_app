import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/widgets/custom_text_field.dart';
import 'package:clinic_booking_app/features/home/presentation/views/tabs/doctors_tab.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomTextField(
            isFilled: true,
            prefixSize: 25,
            borderColor: Colors.white,
            fillColor: AppColors.grey100,
            prefix: FontAwesomeIcons.magnifyingGlass,
            hintText: l10n.searchDoctor,
            type: TextInputType.text,
            onTap: () {},
          ),
          const SizedBox(height: 24),
          TabBar(
            dividerHeight: 0,
            isScrollable: false,
            labelColor: AppColors.mainColor,
            labelStyle: Theme.of(context).textTheme.labelLarge,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(color: AppColors.mainColor, width: 2),
            ),
            tabs: const [
              Tab(text: "Pediatrician"),
              
            ],
          ),
          const SizedBox(height: 10),
          const Expanded(
            child: TabBarView(
              children: [
                PediatricianTab(),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
