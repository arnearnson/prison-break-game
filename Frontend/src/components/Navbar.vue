<template>
  <!-- Header  -->
  <header class="header">
    <!-- Nav  -->
    <nav class="nav">
      <h1 class="logo">
        <router-link to="/">pbg</router-link>
      </h1>
      <!-- Ul  -->
      <ul v-if="!showMenuBtn" class="ul">
        <!-- Nav item  -->
        <li class="nav-item">
          <router-link to="/breakout">Breakouts</router-link>
        </li>
        <!-- Nav item  -->
        <li class="nav-item">
          <router-link to="/blackmarket">BLACK MARKET</router-link>
        </li>
        <!-- Nav item  -->
        <li class="nav-item">
          <router-link to="/profile">Profile</router-link>
        </li>
        <!-- Nav item  -->
        <li class="nav-item wallet-btn">
         <fa icon="wallet" /> x1v4.x1c3
        </li>
      </ul>
      <!-- Menu button  -->
      <div @click="showMbUl = !showMbUl" v-if="showMenuBtn" class="menu-btn">
        <span class="bar"></span>
        <span class="bar"></span>
        <span class="bar"></span>
      </div>
      <!--Mb Ul  -->

      <ul v-if="showMbUl && showMenuBtn" class="mb-ul">
        <!-- Nav item  -->
        <li class="nav-item">
          <router-link to="/breakout">Breakouts</router-link>
        </li>
        <!-- Nav item  -->
        <li class="nav-item">
          <router-link to="/blackmarket">BLACK MARKET</router-link>
        </li>
        <!-- Nav item  -->
        <li class="nav-item">
          <router-link to="/profile">Profile</router-link>
        </li>
        <!-- Nav item  -->
        <li class="nav-item wallet-btn">
          <fa icon="wallet" /> x1v4.x1c3
        </li>
      </ul>
    </nav>
  </header>
  <!-- Header  -->
</template>

<script>
// Importing things we need 
import { ref } from "@vue/reactivity";
import { useRoute } from "vue-router";
export default {
  name: "Navbar",
  setup() {
    // Variables
    const route = useRoute();
    const showMenuBtn = ref(false);
    const showMbUl = ref(false);

    // This function will show and hide mb ul
    window.onresize = function () {
      if (window.screen.availWidth <= 880) {
        showMenuBtn.value = true;
      }
      if (window.screen.availWidth > 880) {
        showMenuBtn.value = false;
      }
    };
    // Returning data
    return { showMenuBtn, showMbUl, route };
  },
};
</script>

<style lang="scss" scoped>
.header {
  background: #000000;
  .nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
    padding: 15px;
    z-index: 5;
    .logo {
      a {
        font-family: "Capture_it";
        font-size: clamp(1.5rem, 2vw + 2rem, 2.5rem);
        color: #fff;
        text-transform: uppercase;
        padding-left: 50px;
        text-decoration: none;
        border: 0px !important;
      }
    }
    .ul {
      display: flex;
      align-items: center;
      gap: 40px;
      padding-right: 50px;
      .nav-item {
        list-style: none;
        a {
          font-size: clamp(1rem, 1vw + 1rem, 1.3rem);
          color: #fff;
          text-transform: capitalize;
          text-decoration: none;
          font-family: "Capture_it";
          // transition: .3s linear;
          &:hover{
             border-bottom: 4px solid #fff;
          }
        }
      }
      .wallet-btn {
        font-size: clamp(1rem, 1vw + 1rem, 1rem);
        border: 2px solid #fff;
        border-radius: 10px;
        color: #fff;
        padding: 5px 20px;
        cursor: pointer;
      }
    }
    .menu-btn {
      cursor: pointer;
      padding-right: 50px;
      .bar {
        display: block;
        background: #fff;
        width: 25px;
        height: 3px;
        margin: 5px;
      }
    }
    .mb-ul {
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column;
      gap: 40px;
      position: absolute;
      background: #000000;
      top: 60px;
      z-index: 5;
      left: 0;
      width: 100%;
      padding: 20px;
      .nav-item {
        list-style: none;
        a {
          font-size: clamp(1rem, 1vw + 1rem, 1.3rem);
          color: #fff;
          text-transform: capitalize;
          text-decoration: none;
          font-family: "Capture_it";
        }
      }
      .wallet-btn {
        font-size: clamp(1rem, 1vw + 1rem, 1rem);
        border: 2px solid #fff;
        border-radius: 10px;
        color: #fff;
        padding: 5px 20px;
      }
    }
  }
}

.router-link-active {
  border-bottom: 4px solid #fff;
}
</style>