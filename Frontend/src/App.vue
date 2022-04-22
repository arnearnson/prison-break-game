<template>
  <!-- Container  -->
  <div class="container">
    <!-- Navbar  -->
    <Navbar />
    <!-- View  -->
    <router-view />
    <!-- Footer  -->
    <Footer />
  </div>
  <!-- Container  -->
</template>

<script>
// Importing things we need

// Components 
import Navbar from "./components/Navbar.vue";
import Footer from "./components/Footer.vue";

export default {
  name: "App",
  components: {
    Navbar,
    Footer,
  },
  setup() {},
};
</script>

<style lang="scss">
// Importing font family
@font-face {
  font-family: "Bradley";
  src: url("./assets/fonts/Bradleyb.woff2");
  font-weight: bold;
}
@font-face {
  font-family: "Capture_it";
  src: url("./assets/fonts/Capture_it.woff2");
  font-weight: bold;
}
@font-face {
  font-family: "Monaco";
  src: url("./assets/fonts/Monaco.woff2");
}
// Setting default styles
* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  font-family: "Monaco";
}
</style>


