# Haxe/hxnodejs externs for the [maxmind](https://www.npmjs.com/package/maxmind) npm library

Tested using `maxmind` version **2.11.0**

## Example

This example requires the free [GeoLite2 database files](https://dev.maxmind.com/geoip/geoip2/geolite2/).

```haxe
package main;

import js.npm.Maxmind;
import js.npm.maxmind.Reader;

class Main {
  static public function main() {
    var countryReader:Reader<CountryResponse> = Maxmind.openSync('data/20181120/GeoLite2-Country.mmdb');
    trace(countryReader.get("8.8.8.8"));
  }
}
```
