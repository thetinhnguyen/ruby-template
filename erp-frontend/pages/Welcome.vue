<template>
  <v-main class="l-page-welcome bg-img-gradient 100%">
    <v-container>
      <LogoHead />
      
      <div class="l-frame-content">
        <v-carousel
          hide-delimiter-background
          show-arrows-on-hover
          class="custom-carousel"
        >
          <v-carousel-item
            v-for="(slide, i) in slides"
            :key="i"
          >
            <v-sheet
              :color="colors[i]"
              height="100%"
            >
              <v-row
                class="fill-height"
                align="center"
                justify="center"
              >
                <div class="text-h2">
                  {{ slide }}
                </div>
              </v-row>
            </v-sheet>
          </v-carousel-item>
        </v-carousel>

        <div class="text-center mt-5">
          <p>
            By tapping Get Started button, you agree to the 
            <span>privacy policy, terms of use</span> end <span>eula. Contact us</span> for help.
          </p>
          
          <p>Have an account? <strong>Sign in here</strong></p>
        </div>

        <div class="l-frame__btn">
          <NuxtLink to="/" class="btn-cmn mt-5">
            <p class="arrow-right">Get Started</p>
          </NuxtLink>
        </div>
      </div>

      <LayoutFooter>@2023 - Salon Manager inc is a Silicon Valley company </LayoutFooter>
    </v-container>
  </v-main>
</template>

<script lang="ts">
import { Component, Vue } from 'nuxt-property-decorator';
import LayoutFooter from '../components/layouts/Footer.vue';
import LogoHead from '../components/layouts/LogoHead.vue'

@Component({
  components: {
    LayoutFooter,
    LogoHead
  },
})
export default class WellcomePage extends Vue {
  colors: string[] = [
    'indigo',
    'warning',
    'pink darken-2',
    'red lighten-1',
    'deep-purple accent-4',
  ];
  slides: string[] = [
    '',
    '',
    '',
    '',
    '',
  ]
}
</script>
