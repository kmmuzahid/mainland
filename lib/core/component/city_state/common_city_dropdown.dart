import 'package:flutter/material.dart';
import 'package:flutter_country_state/complied_cities.dart';
import 'package:mainland/core/component/other_widgets/common_drop_down.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';

class CommonCityDropDown extends StatelessWidget {
  const CommonCityDropDown({
    required this.onChange,
    super.key,
    this.selectedState,
    this.selectedCountry,
    this.initalCity,
    this.backgroundColor,
    this.fontStyle,
  });
  final String? selectedState;
  final String? selectedCountry;
  final String? initalCity;
  final FontStyle? fontStyle;
  final Color? backgroundColor;
  final Function(String value) onChange;
  @override
  Widget build(BuildContext context) {
    final city = getTheCities(
      country: selectedCountry ?? '',
      state: selectedState ?? '',
    ).map((e) => MapEntry(e, e)).toList()..sort((a, b) => a.key.compareTo(b.key));
    return CommonDropDown<MapEntry<String, String>>(
      hint: AppString.city,
      prefix: _requiredIcon(),
      fontStyle: fontStyle,
      items: city,
      textStyle: AppTextStyles.bodyMedium,
      borderColor: AppColors.disable,
      initalValue: selectedState != null && selectedCountry != null && initalCity != null
          ? city.firstWhere(
              (element) => element.key.trim().toLowerCase() == initalCity!.trim().toLowerCase(),
              orElse: () => city.first,
            )
          : null,
      enableInitalSelection: false,
      backgroundColor: backgroundColor ?? AppColors.disable,
      isRequired: true,
      onChanged: (states) {
        onChange(states?.value ?? '');
      },
      nameBuilder: (states) {
        return states.value;
      },
    );
  }

  List<String> getTheCities({required String country, required String state}) {
    if (country.isEmpty || state.isEmpty) {
      return [];
    }
    List<Map<String, dynamic>>? selectedCountryData;

    for (final countryData in allStatesWithCities) {
      if (countryData is Map<String, dynamic> && countryData.containsKey(country)) {
        selectedCountryData = countryData[country];
      }
    }

    if (selectedCountryData != null) {
      for (final stateData in selectedCountryData) {
        for (final stateEntry in stateData.entries) {
          final String stateName = stateEntry.key;
          if (stateName.trim().toLowerCase() == state.trim().toLowerCase()) {
            return stateEntry.value;
          }
        }
      }
    }
    return [];
  }

  Widget _requiredIcon() =>
      const CommonText(text: '*', textColor: AppColors.warning, fontSize: 20, top: 10);
}

