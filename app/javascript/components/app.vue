<template>
  <div class="center hidden mv4">
    <side :side="side1" :btn-color="'bg-dark-blue'" :correct="correct_answer != 1"></side>
    <score-board></score-board>
    <side :side="side2" :btnColor="'bg-dark-red'" :correct="correct_answer != -1"></side>
  </div>
</template>

<script>
import Side from "./side.vue"
import ScoreBoard from "./score_board.vue"
import { mapState } from 'vuex'

export default {
  components: {
    side: Side,
    "score-board": ScoreBoard
  },
  computed: mapState(['side1', 'side2', 'correct_answer'])
}
</script>
