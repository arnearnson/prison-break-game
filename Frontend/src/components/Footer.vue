<template>
  <!-- Footer  -->
  <footer class="footer">
    <!-- Line  -->
    <hr class="line" />
    <!-- Title  -->
    <h1 class="title">Prison Break Game</h1>
    <!-- Socials  -->
    <div class="socials">
      <router-link to="/"> <fa :icon="['fab','twitter']" /> whitepaper</router-link>
      <router-link to="/"> <fa :icon="['fab','twitter']" /> twitter </router-link>
      <router-link to="/"> <fa :icon="['fab','discord']" /> discord</router-link>
    </div>
  </footer>
  <!-- Footer  -->
</template>

<script>
export default {
  name: "Footer",
};
</script>

<style lang="scss" scoped>
.footer {
  background: #000;
  padding: 50px 20px;
  .line {
    max-width: 1000px;
    margin: auto;
    z-index: 5;
    position: relative;
    padding: 0px 20px;
  }
  .title {
    color: #fff;
    z-index: 5;
    position: relative;
    text-align: center;
    padding: 20px;
    font-size: clamp(1.5rem, 2vw + 2rem, 3rem);
    font-family: "Capture_it";
    margin: 30px 0px;
  }
  .socials {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    gap: 30px;
    z-index: 5;
    position: relative;
    a {
      background: #fff;
      color: #000;
      font-size: 1.2rem;
      text-transform: capitalize;
      padding: 10px 20px;
      min-width: 150px;
      text-align: center;
      text-decoration: none;
      font-family: "Monaco";
      border-radius: 5px;
      i{
        color: #000;
      }
    }
  }
}
</style>