import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
/* import font awesome icon component */
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
/* import the fontawesome core */
import { library } from "@fortawesome/fontawesome-svg-core";
/* import specific icons */
import { fas } from "@fortawesome/free-solid-svg-icons";
import { fab } from "@fortawesome/free-brands-svg-icons";
/* add icons to the library */
library.add(fas,fab);

createApp(App).use(store).component("fa",FontAwesomeIcon).use(router).mount("#app");