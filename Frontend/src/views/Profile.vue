<template>
  <!-- Profile  -->
  <div class="profile">
    <!-- Profile title -->
    <h1 class="profile-title">profile</h1>
    <!-- Showcase  -->
    <div class="showcase">
      <!-- Left  -->
      <div class="left">
        <img :src="profileImage" alt="poster" />
      </div>
      <!-- Right  -->
      <div class="right">
        <p>Character: Michael Scofield</p>
        <p>In prison since 1st June 2022</p>
      </div>
    </div>
    <!-- Game title  -->
    <h1 class="game-title">game items</h1>
    <!-- Creat Table  -->
    <CreateTable :tableData="gameItem" :tableTile="gameTitle" />
  </div>
  <!-- Profile  -->
</template>

<script>
// Importing thing we need
// Components
import CreateTable from "../components/CreateTable.vue";
// Images
import profileImage from "../assets/images/CharacterCard.png";
import cigImage from "../assets/images/CigarettesFiverr.png";
import gunImage from "../assets/images/GunFiverr.png";
import knifeImage from "../assets/images/KnifeFiverr.png";

export default {
  name: "Profile",
  components: { CreateTable },
  setup() {
    // Variables
    const gameItem = [
      {
        item: {
          img: cigImage,
          text: "Pack of Cigarettes - Item #44",
        },
        treasure: "32 TFUEL",
      },
      {
        item: {
          img: knifeImage,
          text: "Knife - Item #12",
        },
        treasure: "87 TFUEL",
      },
      {
        item: {
          img: knifeImage,
          text: "Knife - Item #4",
        },
        treasure: "79 TFUEL",
      },
      {
        item: {
          img: gunImage,
          text: "Gun - Item #9",
        },
        treasure: "143 TFUEL",
      },
    ];
    const gameTitle = ["Item", "Price"];
    // Returning data
    return { profileImage, gameItem, gameTitle };
  },
};
</script>

<style lang="scss" scoped>
.profile {
  .profile-title {
    font-family: "Capture_it";
    font-size: clamp(1rem, 2vw + 2rem, 2.5rem);
    padding: 20px 0px;
    margin-top: 30px;
    max-width: 95%;
    margin: auto;
    margin: 30px;
  }
  .showcase {
    display: flex;
    flex-wrap: wrap;
    gap: 50px;
    max-width: 95%;
    margin: auto;
    .left {
      img {
        max-width: 500px;
      }
    }
    .right {
      p {
        font-size: clamp(1rem, 2vw + 2rem, 1.5rem);
        padding: 15px 10px;
      }
    }
  }
  .game-title {
    max-width: 95%;
    margin: auto;
    font-family: "Capture_it";
    font-size: clamp(1.5rem, 2vw + 2rem, 2.5rem);
    padding: 20px 0px;
    margin-top: 50px;
  }
}
</style>