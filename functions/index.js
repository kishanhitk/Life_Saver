const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp()
exports.sendNotification = functions.firestore.document('alertCollection/{alertCollectionid}/alerts/{alertid}').onCreate((snap, context) => {
    const doc = snap.data()
    console.log(doc)

    const blood = doc.bloodGroup
    console.log(blood)
    const payload = {
        notification: {
            title: "Someone needs blood",
            body: `Blood Group required : ${blood}`,
            click_action: 'FLUTTER_NOTIFICATION_CLICK'
        }
    }

    admin.messaging().sendToTopic(blood, payload)
})
