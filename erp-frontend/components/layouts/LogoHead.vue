<template>
  <div class="logo-head">
    <NuxtLink to="/">
      <img src="~/assets/images/logo.png"/>
    </NuxtLink>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'nuxt-property-decorator'

@Component
export default class LogoHead extends Vue {}
</script>