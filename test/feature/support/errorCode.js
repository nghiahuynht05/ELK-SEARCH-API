function define(name, value) {
    Object.defineProperty(exports, name, {
        value: value,
        enumerable: true
    });
}
//==============DRIVER================
define("VALIDATION_ERROR", 400);
define("ACCESS_DENIED", 403);