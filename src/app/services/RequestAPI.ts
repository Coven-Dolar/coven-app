import {Injectable, isDevMode} from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Observable} from 'rxjs';
import {environment} from '../../environments/environment';


@Injectable({
    providedIn: 'root'
})
export class RequestAPI {
    private ambiente: string;

    constructor(private http: HttpClient) {
        this.ambiente = environment.URL_API;
    }

    private getHeader(): HttpHeaders {
        return new HttpHeaders({
            Authorization:  'Token ' + environment.API_TOKEN
        });
    }

    public getBody(form: any) {
        return new Promise(resolve => {
            const body = new URLSearchParams();
            // tslint:disable-next-line:forin
            for (const key in form) {
                body.append(key, form[key]);
            }
            console.log(body.toString());
            resolve(body.toString());
        });
    }

    /**
     * POST
     * url recebe função a ser chamada na API
     * dados recebe uma string
     */
    public post(url: string, form: any, isPrivate = false): Observable<any> {
        let headerRequest: any;
        if (!isPrivate) {
            headerRequest = {
                headers: new HttpHeaders().set('Content-Type', 'application/x-www-form-urlencoded'),
            };
        } else {
            headerRequest = {
                headers: this.getHeader().set('Content-Type', 'application/x-www-form-urlencoded'),
            };
        }

        return this.http.post(
            this.ambiente + url,
            form,
            headerRequest
        );

    }

    public put(url: string, dados) {

        return this.http.put(
            this.ambiente + url,
            JSON.stringify(dados)
        );
    }

    /**
     * GET
     * url recebe função a ser chamada na API
     * filtro valor que será filtrado na API
     */
    public get(url: string, dados = {}, prv = true) {
        if (prv) {
            return this.http.get(
                this.ambiente + url,
                {
                    params: dados,
                    headers: this.getHeader()
                }
            );
        } else {
            return this.http.get(
                this.ambiente + url,
                {
                    params: dados
                }
            );
        }

    }

    /**
     * DELETE
     * url recebe função a ser chamada na API
     * filtro valor que será filtrado na API
     */
    public delete(url: string, dados = {}) {
        return this.http.delete(
            this.ambiente + url ,
            {
                params: dados,
            }
        );
    }

    /**
     * GET com promise
     * url recebe função a ser chamada na API
     * filtro valor que será filtrado na API
     */
    public async getPromise(url: string, dados = {}) {
        return this.http
            .get(this.ambiente + url, {
                params: dados
            })
            .toPromise()
            .then(resposta => {
                return resposta;
            })
            .catch(erro => {
                console.log(erro);
            });
    }

}
