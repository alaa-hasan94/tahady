const admin = require("firebase-admin/app");
admin.initializeApp();

const logoutFromOtherDevices = require("./logout_from_other_devices.js");
exports.logoutFromOtherDevices = logoutFromOtherDevices.logoutFromOtherDevices;
