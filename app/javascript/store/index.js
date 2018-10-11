import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';

import Axios from 'axios';

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    side1: { "name": "Side 1a" },
    side2: { "name": "Side 2b",  "transactions": [] },
    lives: 3,
    score: 0,
    enable_next: false,
    correct: false, // what the user entered
    correct_answer: 0, // which side is larger
  },
  mutations: {
    correct (state) {
      state.score += 1
      state.correct = true
      state.enable_next = true
    },
    wrong (state) {
      state.lives -= 1
      state.correct = false
      state.enable_next = true
    },
    newGame (state) {
      state.lives = 3
      state.score = 0
      state.enable_next = false
    }
  },
  actions: {
    getNextQuestion ({ state, commit }) {
      state.enable_next = false
      // If lives were at 0 start a new game
      if (state.lives <= 0) {
        commit('newGame')
      }

      Axios.get('/game/question').then(function(res) {
        // console.log(res)
        state.correct_answer = res.data.correct_answer
        state.side1 = res.data.side1
        state.side2 = res.data.side2
      }).catch(function (error) {
        console.log(error);
      })
    }
  }
})