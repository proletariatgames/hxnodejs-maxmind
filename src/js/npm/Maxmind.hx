package js.npm;
import js.npm.maxmind.Reader;

extern class OpenOpts {
  public var cache : { max: Int };
  public var watchForUpdates : Bool;
  public var watchForUpdatesNonPersistent : Bool;
  public var watchForUpdatesHook : Void -> Void;
}

@:jsRequire('maxmind')
extern class Maxmind
{
  public static function openSync<T:Response>(filepath:String, ?opts:OpenOpts) : Reader<T>;
}
