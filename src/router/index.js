import Vue from "vue";
import VueRouter from "vue-router";
import Dashboard from "../views/Dashboard.vue";
import Settings from "../views/Settings.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Dashboard",
    component: Dashboard
  },
  {
    path: "/settings",
    name: "Settings",
    component: Settings
  }
];

const router = new VueRouter({
  routes
});

export default router;
