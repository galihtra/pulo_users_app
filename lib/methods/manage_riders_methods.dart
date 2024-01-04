

import '../models/online_nearby_riders.dart';

class ManageRidersMethods
{
  static List<OnlineNearbyRiders> nearbyOnlineRidersList = [];

  static void removeRiderFromList(String riderID)
  {
    int index = nearbyOnlineRidersList.indexWhere((driver) => driver.uidRider == riderID);

    if(nearbyOnlineRidersList.length > 0)
    {
      nearbyOnlineRidersList.removeAt(index);
    }
  }

  static void updateOnlineNearbyRidersLocation(OnlineNearbyRiders nearbyOnlineDriverInformation)
  {
    int index = nearbyOnlineRidersList.indexWhere((driver) => driver.uidRider == nearbyOnlineDriverInformation.uidRider);

    nearbyOnlineRidersList[index].latRider = nearbyOnlineDriverInformation.latRider;
    nearbyOnlineRidersList[index].lngRider = nearbyOnlineDriverInformation.lngRider;
  }
}