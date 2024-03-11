const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.logoutFromOtherDevices = functions.https.onCall(
  async (data, context) => {
    if (!context.auth) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "Authentication required.",
      );
    }

    // Revoke refresh tokens for the current user
    try {
      await admin.auth().revokeRefreshTokens(context.auth.uid);
      return { message: "User logged out from other devices successfully." };
    } catch (error) {
      throw new functions.https.HttpsError(
        "internal",
        "Unable to revoke refresh tokens: " + error,
      );
    }
  },
);
