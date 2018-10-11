<template>
  <div class="transaction-list">
    <div class="transaction-hint tc" v-show="!showTransactions">
      <div v-if="showHint">
        <p class="pa3">
          <span class="b">Hint:</span>
          You had {{ transaction_count }} during this time period.
        </p>
      </div>
      <div v-else>
        <p class="pa3">
          <a @click.prevent="toggleHint()" href="" class="courier">
            Show me a hint
          </a>
        </p>
      </div>
    </div>

    <div v-if="showTransactions" class="courier">
      <h3 class="tc">Total: ${{ total }}</h3>

      <ul class="center measure">
        <li v-for="transaction in side.transactions" class="pv2 pr3">
          {{ transaction.date }} &raquo; <span class="b">${{ transaction.amount }}</span> @ {{ transaction.name }}
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    "side": {
      type: Object,
    }
  },
  data: function () {
    return {
      showHint: false,
    }
  },
  computed: {
    showTransactions() {
      this.showHint = false
      return this.$store.state.enable_next
    },
    count() {
      var res = this.side.transactions
      if (typeof res != 'undefined') { return res.length } else { return 0 }
    },
    total() {
      var total = this.side.total
      if (typeof total != 'undefined') { return total } else { return 0 }
    },
    transaction_count(){
      if (this.count != 1) {
        return this.count + " transactions"
      } else {
        return this.count + " transaction"
      }
    }
  },
  methods: {
    toggleHint() {
      this.showHint = true
    }
  }
}
</script>

<style scoped>
  .courier {
    font-family: courier;
  }
</style>