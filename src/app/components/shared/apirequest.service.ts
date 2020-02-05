import {Injectable, isDevMode} from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '../../../environments/environment';
import {Observable} from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class APIRequestService {
  private ambiente: string;

  constructor(private http: HttpClient) {
    if (isDevMode()) {
      this.ambiente = environment.URL_API;
    }
  }
  private getHeader(): HttpHeaders {
    return new HttpHeaders({
      Authorization: 'Token ' + environment.API_TOKEN
    });
  }

  /**
   * POST
   * url recebe função a ser chamada na API
   * dados recebe uma string
   */
  public post(url: string, data: any, isPrivate = false): Observable<any> {
    let headerRequest: any;
    if (isPrivate) {
      headerRequest = {
        headers: this.getHeader().set('Content-Type', 'application/x-www-form-urlencoded')
      };
    }

    return this.http.post(
        this.ambiente + url, data, headerRequest
    );

  }

  /**
   * GET
   * url recebe função a ser chamada na API
   * filtro valor que será filtrado na API
   */
  public get(url: string, dados = {}): Observable<any> {
    return this.http.get(
        this.ambiente + url,
        {
          params: dados,
          headers: this.getHeader()
        }
    );
  }

}
