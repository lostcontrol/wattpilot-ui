<template>
  <v-container>
    <CurrentState />
    <CurrentLoad />
    <CurrentWeather />
    <ScheduleTrigger />
  </v-container>
</template>

<script>
// @ is an alias to /src
import CurrentState from "@/components/CurrentState.vue";
import CurrentLoad from "@/components/CurrentLoad.vue";
import CurrentWeather from "@/components/CurrentWeather.vue";
import ScheduleTrigger from "@/components/ScheduleTrigger.vue";

export default {
  name: "Dashboard",
  components: {
    CurrentState,
    CurrentLoad,
    CurrentWeather,
    ScheduleTrigger
  }
};
</script>
