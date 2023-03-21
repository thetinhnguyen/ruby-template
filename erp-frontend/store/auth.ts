import * as mutationTypes from '~/utils/mutation-type';
import { VuexModule, Module, Mutation, Action } from 'vuex-module-decorators'
import { Context } from '@nuxt/types'

@Module({
  name: 'auth',
  stateFactory: true,
  namespaced: true,
})
export default class Auth extends VuexModule {
  /**
  * initial state
  */
  private _token: string | null = null

  /**
  * initial getters
  */
  get token(): string | null {
    return this._token;
  }

  /**
  * initial mutations
  */
  @Mutation
  private SET_TOKEN(token: string | null) {
    this._token = token
  }

  /**
  * initial actions
  */
  @Action
  async login(context: Context, payload: { email: string, password: string }) {
    // const { data } = await context.$repositories.auth.login(payload)
    // this.SET_TOKEN(data.token)
  }

  @Action
  logout() {
    // this.SET_TOKEN(null)
  }
}
