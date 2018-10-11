<template>
  <div class="fl w-40-ns w-100 ba">
    <div class="side1">
      <div class="side-title f4 bg-near-black white mv0 pv2 ph3 tc">
        <span class="i">{{ side.date }}</span> - {{ side.category_name }}
      </div>

      <transaction-list :side="side"></transaction-list>

      <div class="side-btn pa2" v-if="!showTransactions">
        <a class="f4 w-100 link dim ph3 pv2 dib white tc" :class="[btnColor]" @click.prevent="selectSide()" href="#">This side!</a>
      </div>
    </div>
  </div>
</template>

<script>
import TrnsactionList from './transaction_list.vue'

export default {
  props: {
    side: {
      type: Object,
    },
    btnColor: {
      type: String,
      default: "bg-near-black"
    },
    correct: {
      type: Boolean
    }
  },
  computed: {
    showTransactions() {
      return this.$store.state.enable_next
    }
  },
  components: {
    "transaction-list": TrnsactionList
  },
  methods: {
    selectSide() {
      if (this.correct) {
        this.$store.commit('correct')
      } else {
        this.$store.commit('wrong')
      }
    }
  }
}
</script>