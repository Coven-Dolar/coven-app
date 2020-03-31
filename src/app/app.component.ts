import { Component } from '@angular/core';

import { Platform } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';
import {FCM} from '@ionic-native/fcm/ngx';
import {RequestAPI} from './services/RequestAPI';

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.scss']
})
export class AppComponent {
  constructor(
    private platform: Platform,
    private splashScreen: SplashScreen,
    private statusBar: StatusBar,
    private firebase: FCM,
    private http: RequestAPI,
  ) {
    this.initializeApp();
  }

  initializeApp() {
    this.platform.ready().then(() => {
      // this.statusBar.styleDefault();
      this.statusBar.overlaysWebView(false);
      this.statusBar.backgroundColorByHexString("#34a5e9");
      this.statusBar.styleLightContent();
      this.splashScreen.hide();
      this.setToken();
    });
  }

  async setToken() {
    const token = await this.firebase.getToken();
    let platf = 'android';
    if (!this.platform.is('android')) {
      platf = 'ios';
    }
    const jsonRequest = {
      device_id: token.substring(1, 100),
      registration_id: token,
      type: platf
    };
    console.log(token);
    this.http.post('devices', await this.http.getBody(jsonRequest)).subscribe( (resposta: any) => {
      console.log(resposta);
    }, error => {

    });
  }
}
