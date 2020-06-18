<template>
  <v-card class="ma-4" max-width="344">
    <v-card-title>Schedule trigger</v-card-title>
    <v-card-text>
      Schedule trigger is
      <b>{{ state }}</b>.
    </v-card-text>
    <v-card-actions>
      <v-btn text @click="changeTrigger(true)">Set</v-btn>
      <v-btn text @click="changeTrigger(false)">Unset</v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
import { HTTP } from "@/services/http-common.js";

export default {
  name: "ScheduleTrigger",
  data: () => ({
    state: "-"
  }),
  methods: {
    changeTrigger: function(value) {
      var me = this;
      HTTP.post("schedule/trigger", { trigger: value }).then(function(
        response
      ) {
        console.log(response);
        me.updateTrigger();
      });
    },
    updateTrigger: function() {
      HTTP.get("schedule/trigger")
        .then(response => {
          this.state = response.data.trigger ? "enable" : "disable";
        })
        .catch(e => {
          console.log(e);
          this.state = "-";
        });
    }
  },
  mounted() {
    this.updateTrigger();
  }
};
</script>
