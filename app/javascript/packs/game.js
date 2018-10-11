import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import App from '../components/app.vue'
import TurbolinksAdapter from 'vue-turbolinks'

import { store } from '../store';

Vue.use(TurbolinksAdapter)
Vue.use(Vuex)

document.addEventListener('turbolinks:load', () => {
  var element = document.getElementById("game")
  if (element != null) {
    var app = new Vue({
      el: '#game',
      template: '<App/>',
      components: { App },
      store: store,
      mounted: function() {
        setTimeout(function() {store.dispatch('getNextQuestion') }, 50);
      }
    })
  }
})