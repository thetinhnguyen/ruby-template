import Repository from '~/apis/repository'
import { Plugin } from '@nuxt/types'

const repositoryPlugin: Plugin = (context, inject) => {
  const repositoryWithAxios = (resource: string) => {
    return new Repository(context.$axios, resource)
  }

  const repositories = {
    auth: repositoryWithAxios('/auth')
  }

  inject('repositories', repositories)
}

export default repositoryPlugin