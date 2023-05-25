import 'dart:io';

getLocationPcIp() async {
  // 内网ip
  for (var interface in await NetworkInterface.list()) {
    for (var addr in interface.addresses) {
      if (addr.type.name == 'IPv4') {
        return addr.address;
      }
    }
  }
}
