<template>
  <v-container>
    <ChangeState />
  </v-container>
</template>

<script>
// @ is an alias to /src
import ChangeState from "@/components/ChangeState.vue";

export default {
  name: "Settings",
  components: {
    ChangeState
  }
};
</script>
