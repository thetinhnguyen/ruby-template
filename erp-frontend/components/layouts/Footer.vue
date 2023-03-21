<template>
  <p class="l-frame-footer">
    <slot />
  </p>
</template>

<script lang="ts">
import { Component, Vue } from 'nuxt-property-decorator'

@Component
export default class LayoutFooter extends Vue {}
</script>