<template>
  <!-- Black Market  -->
  <div class="black-market">
    <!-- Market title  -->
    <h1 class="market-title">Current Auctions</h1>
    <!-- Auction  -->
    <div class="auction">
      <!-- Left  -->
      <div class="left">
        <img class="cig-img" :src="cigImage" alt="poster" />
        <div>
          <p class="name">Pack of Cigarettes</p>
          <p>Item #61</p>
          <p class="cur-bit">
            Current Bid: 3 <img class="icon" :src="iconImage" alt="icon" />
          </p>
        </div>
      </div>
      <!-- Right  -->
      <div class="right">
        <button @click="bit" class="btn-bit">bit</button>
        <button @click="placeBit" class="btn-place_bit">place bit</button>
      </div>
    </div>
    <!-- Breakout title  -->
    <h1 class="sales-title">Previous Sales</h1>
    <!-- Creat Table  -->
    <CreateTable :tableData="prevSales" :tableTile="salesTitle" />
  </div>
  <!-- Black Market  -->
</template>

<script>
// Importing things we need
// Components
import CreateTable from "../components/CreateTable.vue";
// Images
import cigImage from "../assets/images/CigarettesFiverr.png";
import gunImage from "../assets/images/GunFiverr.png";
import knifeImage from "../assets/images/KnifeFiverr.png";
import iconImage from "../assets/images/Image 5@2x.png";

export default {
  name: "BlackMarket",
  components: { CreateTable },
  setup() {
    // Variables

    const prevSales = [
      {
        date: "01.04.2022",
        item: {
          img: cigImage,
          text: "Pack of Cigarettes - Item #44",
        },
        treasure: "32 TFUEL",
      },
      {
        date: "02.04.2022",
        item: {
          img: knifeImage,
          text: "Knife - Item #12",
        },
        treasure: "87 TFUEL",
      },
      {
        date: "03.04.2022",
        item: {
          img: knifeImage,
          text: "Knife - Item #4",
        },
        treasure: "79 TFUEL",
      },
      {
        date: "04.04.2022",
        item: {
          img: gunImage,
          text: "Gun - Item #9",
        },
        treasure: "143 TFUEL",
      },
    ];
    const salesTitle = ["Data", "Item", "Price"];

    // Function

    const bit = async () => {
      console.log("Working from black market page");
    };

    const placeBit = async () => {
      console.log("Working from black market page");
    };

    // Returning data
    return { cigImage, iconImage, prevSales, salesTitle, bit, placeBit };
  },
};
</script>

<style lang="scss" scoped>
.black-market {
  .market-title {
    font-family: "Capture_it";
    font-size: clamp(1.5rem, 2vw + 2rem, 2.5rem);
    padding: 20px 0px;
    max-width: 95%;
    margin: 30px auto;
  }
  .auction {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 150px;
    align-items: center;
    padding: 40px 20px;
    border: 1px solid #5555;
    border-radius: 5px;
    min-height: 300px;
    max-width: 95%;
    margin: 30px auto;
    .left {
      display: flex;
      align-items: center;
      .cig-img {
        width: 180px;
      }
      p {
        font-size: clamp(1rem, 2vw + 2rem, 1.2rem);
        padding: 10px;
      }
      .cur-bit {
        display: flex;
        align-items: center;
        gap: 10px;
      }
      .icon {
        width: 30px;
      }
    }
    .right {
      display: flex;
      flex-direction: column;
      gap: 10px;
      button {
        padding: 5px 10px;
        font-size: 1rem;
        text-transform: capitalize;
        border: 0px;
        border-radius: 10px;
        min-width: 150px;
        cursor: pointer;
      }
      .btn-bit {
        background: transparent;
        border: 2px solid #222;
        color: #999;
      }
      .btn-place_bit {
        background: #222;
        color: #fff;
        padding: 8px 10px;
      }
    }
  }
  .sales-title {
    max-width: 95%;
    margin: auto;
    font-family: "Capture_it";
    font-size: clamp(1.5rem, 2vw + 2rem, 2.5rem);
    padding: 20px 0px;
    margin-top: 50px;
  }
}
</style>