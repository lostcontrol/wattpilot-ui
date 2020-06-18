<template>
  <v-card class="ma-4" max-width="344">
    <v-card-title>System state</v-card-title>
    <v-card-text>
      System in
      <b>{{ state }}</b> state.
    </v-card-text>
  </v-card>
</template>

<script>
import HTTP from "@/services/http-common.js";

export default {
  name: "CurrentState",
  data: () => ({
    state: "-",
    polling: null
  }),
  methods: {
    updateState: function() {
      HTTP.get("state")
        .then(response => {
          this.state = response.data.state;
        })
        .catch(e => {
          console.log(e);
          this.state = "-";
        })
        .finally(() => {
          this.polling = setTimeout(this.updateState, 5000);
        });
    }
  },
  mounted() {
    this.updateState();
  },
  beforeDestroy() {
    clearTimeout(this.polling);
  }
};
</script>
