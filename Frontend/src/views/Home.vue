<template>
  <!-- Home  -->
  <div class="home">
    <!-- Landing  -->
    <div class="landing">
      <!-- letter  -->
      <div class="letter">
        <!-- Letter content  -->
        <div class="letter-content">
          <!-- Letter subject  -->
          <p class="letter-sub">Dear Prisoners,</p>
          <!-- Letter welcome  -->
          <p class="letter-wel">
            welcome to the Prison Break Game and your first sentence in jail.
          </p>
          <!-- Letter text  -->
          <p class="letter-text">
            Rumors have it that there is a constantly growing treasure outside
            our walls. We will make sure that only the smartest of you with the
            best breakout strategy and equipment will make it out. So better
            come prepared. Yours truly,
          </p>
          <!-- Letter from  -->
          <p class="letter-from">Warden</p>
        </div>
      </div>
    </div>
    <!-- Layer  -->
    <div class="layer"></div>
  </div>
  <!-- Home  -->
</template>

<script>
export default {
  name: "Home",
  setup() {},
};
</script>


<style lang="scss" scoped>
.home {
  display: grid;
  place-items: center;
  background: url("../assets/images/background1.png");
  background-position: center;
  background-repeat: no-repeat;
  min-height: 100vh;
  position: relative;
  background-size: cover;

  .landing {
    position: relative;
    .letter {
      display: flex;
      justify-content: space-between;
      flex-direction: column;
      gap: 50px;
      position: relative;
      .letter-content {
        display: flex;
        flex-direction: column;
        gap: 30px;
        background: url("../assets/images/Note.png");
        background-size: cover;
        background-position-x: center;
        padding: 50px;
        border-radius: 5px;
        z-index: 3;
      }
      p {
        // position: absolute;
        font-family: "Bradley";
        font-size: clamp(1rem, 2vw + 1rem, 1.5rem);
        font-weight: 700;
        max-width: 400px;
      }
      .letter-sub {
        margin-top: 40px;
      }
    }
  }
  .layer {
    background: rgba(0, 0, 0, 0.5);
    position: fixed;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
  }
}

@media only screen and(max-width:530px) {
  .home {
    .landing {
      .letter {
        margin: 10px;
        .letter-content {
          padding: 50px 20px;
        }
      }
    }
  }
}
</style>