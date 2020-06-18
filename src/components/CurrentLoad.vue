<template>
  <v-card class="ma-4" max-width="344">
    <v-card-title>Loads</v-card-title>
    <v-card-text>
      There is currently
      <b>{{ loads.length }}</b> active loads.
    </v-card-text>
  </v-card>
</template>

<script>
import HTTP from "@/services/http-common.js";

export default {
  name: "CurrentLoad",
  data: () => ({
    loads: [],
    polling: null
  }),
  methods: {
    updateLoads: function() {
      HTTP.get("loads")
        .then(response => {
          this.loads = response.data;
        })
        .catch(e => {
          console.log(e);
          this.loads = [];
        })
        .finally(() => {
          this.polling = setTimeout(this.updateLoads, 5000);
        });
    }
  },
  mounted() {
    this.updateLoads();
  },
  beforeDestroy() {
    clearTimeout(this.polling);
  }
};
</script>
