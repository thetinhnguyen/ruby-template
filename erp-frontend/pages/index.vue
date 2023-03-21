<template>
  <v-row justify="center" align="center">
    <v-col cols="12" sm="8" md="6">
      hello world
    </v-col>
  </v-row>
</template>

<script lang="ts">
import { Component, Vue } from 'nuxt-property-decorator'

@Component({
  middleware: ['auth']
})
export default class IndexPage extends Vue {}
</script>
