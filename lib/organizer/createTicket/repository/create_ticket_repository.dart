import 'package:image_picker/image_picker.dart';
import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/network/request_input.dart';
import 'package:mainland/core/config/network/response_state.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';
import 'package:mainland/user/preferense/model/category_model.dart';
import 'package:mainland/user/preferense/model/sub_category_model.dart';

class CreateTicketRepository {
  DioService dioService = getIt();

  Future<ResponseState<dynamic>> saveDraft({
    required CreateEventModel createEvent,
    required CategoryModel? category,
    required List<SubCategoryModel> subCategory,
    required XFile? image,
  }) async {
    return _buildRequest(true, createEvent, category, subCategory, image);
  }

  Future<ResponseState<dynamic>> submit({
    required CreateEventModel createEvent,
    required CategoryModel? category,
    required List<SubCategoryModel> subCategory,
    required XFile? image,
  }) async {
    return _buildRequest(false, createEvent, category, subCategory, image);
  }

  Future<ResponseState<dynamic>> _buildRequest(
    bool isDraft,
    CreateEventModel createEvent,
    CategoryModel? category,
    List<SubCategoryModel> subCategory,
    XFile? image,
  ) {
    final body = _buildBody(isDraft, createEvent, category, subCategory);

    return dioService.request(
      showMessage: true,
      input: RequestInput(
        files: {if (image != null) 'image': image},
        endpoint:
            '${ApiEndPoint.instance.createEvent}${createEvent.draftId != null ? '/${createEvent.draftId}' : ''}',
        method: createEvent.draftId != null ? RequestMethod.PATCH : RequestMethod.POST,
        jsonBody: body,
      ),
      responseBuilder: (data) => data,
    );
  }

  Map<String, Object?> _buildBody(
    bool isDraft,
    CreateEventModel createEvent,
    CategoryModel? category,
    List<SubCategoryModel> subCategory,
  ) {
    return {
      'eventName': createEvent.title,
      'isFreeEvent': createEvent.isFreeEvent,
      if (category?.id != null && category?.id.isNotEmpty == true)
        'category': [
          {'categoryId': category!.id, 'subCategory': subCategory.map((e) => e.id).toList()},
        ],
      'eventDate': createEvent.eventDate?.millisecondsSinceEpoch,
      'startTime': createEvent.startTime.to12HourString(),
      'endTime': createEvent.endTime.to12HourString(),
      'streetAddress': createEvent.streetAddress1,
      'streetAddress2': createEvent.streetAddress2,
      'city': createEvent.city,
      'state': createEvent.state,
      'country': createEvent.country,
      'tickets': createEvent.ticketTypes.map((e) {
        return {
          'type': e.name?.displayName.toString() ?? '',
          'price': e.setUnitPrice,
          'availableUnits': e.availableUnit,
        };
      }).toList(),
      'ticketSaleStart': createEvent.ticketSaleStartDate?.millisecondsSinceEpoch,
      'preSaleStart': createEvent.preSaleStartDate?.millisecondsSinceEpoch,
      'preSaleEnd': createEvent.preSaleEndDate?.millisecondsSinceEpoch,

      'discountCodes': createEvent.isFreeEvent
          ? []
          : createEvent.discountCodes
                .where((e) => e.code.isNotEmpty)
                .map(
                  (e) => {
                    'code': e.code,
                    'percentage': e.discountPercentage,
                    'expireDate': e.expireDate?.millisecondsSinceEpoch,
                  },
                )
                .toList(),
      'organizerName': createEvent.organizerName,
      'organizerEmail': createEvent.emailAddress,
      'organizerPhone': createEvent.phoneNumber,
      'description': createEvent.description,
      'isDraft': isDraft,
    };
  }
}
