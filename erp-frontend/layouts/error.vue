<template>
  <v-app>
    <h1 v-if="error.statusCode === 404">
      {{ pageNotFound }}
    </h1>
    <h1 v-else>
      {{ otherError }}
    </h1>
    <NuxtLink to="/">
      Home page
    </NuxtLink>
  </v-app>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'nuxt-property-decorator'
import { NuxtAppOptions } from '@nuxt/types/app'

interface ErrorResponse {
  readonly statusCode: number
}

@Component({
  layout: 'empty',
  head(this: EmptyLayout & NuxtAppOptions): { title: string } {
    const title = this.error.statusCode === 404 ? this.pageNotFound : this.otherError
    return {
      title
    }
  },
})
export default class EmptyLayout extends Vue {
  @Prop({ required: true }) error!: ErrorResponse

  pageNotFound: string = '404 Not Found'
  otherError: string = 'An error occurred'
}
</script>

<style>
h1 {
  font-size: 20px;
}
</style>
