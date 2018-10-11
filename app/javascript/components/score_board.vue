<template>
  <div class="fl w-20-ns w-100 pa4-l pa2 tc">
    <div id="score_board" class="b ba pa2">
      <div class="pa2 mb2" :class="[bgColor, color]">
        {{ message }}
      </div>
      
      <div class="pb1">
        Score: <span>{{ score }}</span>
      </div>
      <div>
        Lives Left: <span>{{ lives }}</span>
      </div>
    </div>

    <div v-if="enable_next" class="mt2">
      <a class="f5 w-100 link dim ph3 pv2 dib white bg-gray" href="#0"
        @click.prevent="nextQuestion()">
        {{ btnText }}
      </a>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  computed: mapState({
    score: 'score',
    lives: 'lives',
    enable_next: 'enable_next',
    bgColor (state) {
      if (state.enable_next) {
        if (state.correct) {
          return "bg-dark-green"
        } else {
          return "bg-dark-red"
        }
      } else {
        return "bg-light-yellow"
      }
    },
    color (state) {
      if (state.enable_next) {
        return "white"
      } else {
        return "near-black"
      }
    },
    message (state) {
      if (state.enable_next) {
        if (state.correct) {
          return "Correct"
        } else {
          return "Wrong"
        }
      } else {
        return "Waiting ..."
      }
    },
    btnText (state) {
      if (state.lives > 0) {
        return "Next Question"
      } else {
        alert("Game over!")
        return "New Game"
      }
    }
  }),
  methods: {
    nextQuestion() {
      this.$store.dispatch('getNextQuestion')
    }
  }
}
</script>