import 'package:users_app/models/online_nearby_couriers.dart';

class ManageCouriersMethods
{
  static List<OnlineNearbyCouriers> nearbyOnlineCouriersList = [];

  static void removeCourierFromList(String courierID)
  {
    int index = nearbyOnlineCouriersList.indexWhere((courier) => courier.uidCourier == courierID);

    if(nearbyOnlineCouriersList.length > 0)
    {
      nearbyOnlineCouriersList.removeAt(index);
    }
  }

  static void updateOnlineNearbyCouriersLocation(OnlineNearbyCouriers nearbyOnlineDriverInformation)
  {
    int index = nearbyOnlineCouriersList.indexWhere((courier) => courier.uidCourier == nearbyOnlineDriverInformation.uidCourier);

    nearbyOnlineCouriersList[index].latCourier = nearbyOnlineDriverInformation.latCourier;
    nearbyOnlineCouriersList[index].lngCourier = nearbyOnlineDriverInformation.lngCourier;
  }
}