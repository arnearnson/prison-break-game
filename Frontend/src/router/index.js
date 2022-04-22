import { createRouter, createWebHistory } from "vue-router";
import Home from "../views/Home.vue";
import Breakout from "../views/Breakout.vue";
import BlackMarket from "../views/BlackMarket.vue";
import Profile from "../views/Profile.vue";

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/breakout",
    name: "Breakout",
    component: Breakout,
  },
  {
    path: "/blackmarket",
    name: "BlackMarket",
    component: BlackMarket,
  },
  {
    path: "/profile",
    name: "Profile",
    component: Profile,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
