<template>
  <v-card class="ma-4" max-width="344">
    <v-card-title>Weather</v-card-title>
    <v-card-text>
      Cloudiness is
      <b>{{ cloudiness }}</b>
      % therefore schedule will {{ will_run ? "be" : "not be"}} triggered.
    </v-card-text>
  </v-card>
</template>

<script>
import HTTP from "@/services/http-common.js";

export default {
  name: "CurrentWeather",
  data: () => ({
    cloudiness: -1,
    timestamp: "",
    will_run: false,
    polling: null
  }),
  methods: {
    updateWeather: function() {
      HTTP.get("weather")
        .then(response => {
          this.cloudiness = response.data.cloudiness;
          this.timestamp = response.data.timestamp;
          this.will_run = response.data.will_run;
          this.polling = setTimeout(this.updateWeather, 30 * 6000);
        })
        .catch(e => {
          console.log(e);
          this.cloudiness = -1;
          this.will_run = true;
          this.polling = setTimeout(this.updateWeather, 5000);
        });
    }
  },
  mounted() {
    this.updateWeather();
  },
  beforeDestroy() {
    clearTimeout(this.polling);
  }
};
</script>
