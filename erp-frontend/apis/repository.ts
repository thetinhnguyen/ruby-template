// Provide nuxt-axios instance to use same configuration across the whole project
// I've used typical CRUD method names and actions here
import { NuxtAxiosInstance } from "@nuxtjs/axios";

export default class Repository {
  private $axios: NuxtAxiosInstance;
  private resource: string;

  constructor($axios: NuxtAxiosInstance, resource: string) {
    this.$axios = $axios;
    this.resource = resource;
  }

  index(payload: Record<string, any>): Promise<any> {
    return this.$axios.$get(`${this.resource}`, payload);
  }

  all(): Promise<any> {
    return this.$axios.$get(`${this.resource}/all`);
  }

  logout(): Promise<any> {
    return this.$axios.$post(`${this.resource}/logout`, {})
  }

  login(payload: Record<string, any>): Promise<any> {
    return this.$axios.$post(`${this.resource}/login`, payload)
  }

  forgotPassword(payload: Record<string, any>): Promise<any> {
    return this.$axios.$post(`${this.resource}/forgot-password`, payload)
  }

  resetPassword(payload: Record<string, any>): Promise<any> {
    return this.$axios.$post(`${this.resource}/reset-password`, payload)
  }

  show(id: number, payload: Record<string, any> = {}): Promise<any> {
    return this.$axios.$get(`${this.resource}/${id}`, payload)
  }

  store(payload: Record<string, any>): Promise<any> {
    return this.$axios.$post(`${this.resource}`, payload)
  }
}
