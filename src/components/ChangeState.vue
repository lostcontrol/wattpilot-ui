<template>
  <v-card class="ma-4" max-width="344">
    <v-card-title>Change state</v-card-title>
    <v-card-text>
      Current state is
      <b>{{ state }}</b>.
    </v-card-text>
    <v-card-actions>
      <v-btn text @click="changeState('halt')">Halt</v-btn>
      <v-btn text @click="changeState('idle')">Idle</v-btn>
      <v-btn text @click="changeState('force')">Force</v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
import { HTTP } from "@/services/http-common.js";

export default {
  name: "ChangeState",
  data: () => ({
    state: "-"
  }),
  methods: {
    changeState: function(value) {
      var me = this;
      HTTP.post("state", { state: value }).then(() => {
        me.updateState();
      });
    },
    updateState: function() {
      HTTP.get("state")
        .then(response => {
          this.state = response.data.state;
        })
        .catch(e => {
          console.log(e);
          this.state = "-";
        });
    }
  },
  mounted() {
    this.updateState();
  }
};
</script>
