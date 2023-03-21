import { NuxtAxiosInstance } from '@nuxtjs/axios'

export default class AxiosConfig {
  private axios: NuxtAxiosInstance
  private store: any
  private redirect: any

  constructor($axios: NuxtAxiosInstance, store: any, redirect: any) {
    this.axios = $axios
    this.store = store
    this.redirect = redirect
    this.init()
  }

  private processQueue(error: any, token: any = null) {
    // handle error when connect api fail
  }

  private init() {
    this.axios.onRequest((config) => {
      // return config
    })

    this.axios.onError((error) => {
      //
    })

    this.axios.onRequestError((error) => {
      //
    })

    this.axios.onResponse((response) => {
      //
    })

    this.axios.onResponseError((error) => {
      //
    })
  }
}