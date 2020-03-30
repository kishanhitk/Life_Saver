import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();

const fcm = admin.messaging();

export const sendToTopic = functions.firestore
    .document('users/{userid}')
    .onCreate(async snapshot => {


        const payload: admin.messaging.MessagingPayload = {
            notification: {
                title: 'EMERGENCY!',
                body: `Someone in your area needs blood.`,
                icon: 'https://cdn.pixabay.com/photo/2012/04/12/22/25/warning-sign-30915__340.png',
                click_action: 'FLUTTER_NOTIFICATION_CLICK' // required only for onResume or onLaunch callbacks
            }
        };

        return fcm.sendToDevice('crSVXG0hIP8:APA91bEjt4i1fBFmd5mEKAfKd-JFrM_crQHp8haa4C0tgnMMK_5Nn8AeMf6K1d8sMFnm0w_q7wKnZSDOcqgth42XSaqufF2E5vRXd2prFr2NepUkPhlRK8tabJ27jp4a58D4FCgU68q2', payload);
    });