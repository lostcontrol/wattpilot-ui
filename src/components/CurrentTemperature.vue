<template>
  <v-card class="ma-4" max-width="344">
    <v-card-title>Temperature</v-card-title>
    <v-card-text>
      Boiler temperature is
      <b>{{ temperature }}°C</b>
    </v-card-text>
  </v-card>
</template>

<script>
import HTTP from "@/services/http-common.js";

export default {
  name: "CurrentTemperature",
  data: () => ({
    temperature: -1,
    polling: null
  }),
  methods: {
    updateTemperature: function() {
      HTTP.get("temperature")
        .then(response => {
          this.temperature = response.data.temperature;
          this.polling = setTimeout(this.updateWeather, 60 * 1000);
        })
        .catch(e => {
          console.log(e);
          this.temperature = -1;
          this.polling = setTimeout(this.updateWeather, 5000);
        });
    }
  },
  mounted() {
    this.updateTemperature();
  },
  beforeDestroy() {
    clearTimeout(this.polling);
  }
};
</script>
