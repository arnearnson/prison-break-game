<template>
  <!-- Breakout  -->
  <div class="breakout">
    <!-- Showcase  -->
    <div v-if="!showItem" class="showcase">
      <!-- Title  -->
      <h1 class="title">
        Current treasure <span><img :src="iconImage" alt="icon" /> 756</span>
      </h1>
      <!-- button  -->
      <div class="btn">
        <button @click="showItem = !showitem" class="action-btn">
          start breakout
        </button>
      </div>
    </div>
    <!-- Item tree  -->
    <div v-if="showItem" class="item-tree">
      <!-- Info  -->
      <p class="info">Choose your items</p>
      <!-- Details  -->
      <p class="details">You’re planning to break out? Better come prepared.</p>
      <!-- Card wraper  -->
      <div class="card-wraper">
        <!-- Card  -->
        <div v-for="(card, index) in cards" :key="index" class="card">
          <!-- Left  -->
          <div class="left">
            <!-- Image  -->
            <img :src="card.img" alt="Image" />
          </div>
          <!-- Right  -->
          <div class="right">
            <!-- Name  -->
            <p class="name">{{ card.name }}</p>
            <!-- Available  -->
            <p class="available">available :{{ card.available }}</p>
            <!-- Input  -->
            <input class="input" type="text" placeholder="Enter amount" />
          </div>
        </div>
      </div>
      <p class="details">Your Power Points: XX</p>
      <!-- button  -->
      <div class="btn">
        <!-- Action button  -->
        <button @click="startBreakout" class="action-btn">
          start breakout
        </button>
      </div>
    </div>
    <!-- Breakout title  -->
    <h1 class="break-title">Previous Breakouts</h1>
    <!-- Creat Table  -->
    <CreateTable :tableData="prevBreackout" :tableTile="breakoutTitle" />
  </div>
  <!-- Breakout  -->
</template>

<script>
// Importing things we need
import { ref } from "@vue/reactivity";
// Components
import CreateTable from "../components/CreateTable.vue";
// Images
import iconImage from "../assets/images/Image 5.png";
import cigImage from "../assets/images/CigarettesFiverr.png";
import gunImage from "../assets/images/GunFiverr.png";
import knifeImage from "../assets/images/KnifeFiverr.png";
export default {
  name: "Breakout",
  components: { CreateTable },
  setup() {
    //   Variables
    const prevBreackout = [
      {
        date: "01.04.2022",
        breakoutAtt: "3",
        treasure: "1,523 TFUEL",
      },
      {
        date: "02.04.2022",
        breakoutAtt: "2",
        treasure: "459 TFUEL",
      },
      {
        date: "03.04.2022",
        breakoutAtt: "4",
        treasure: "452 TFUEL",
      },
      {
        date: "04.04.2022",
        breakoutAtt: "2",
        treasure: "873 TFUEL",
      },
      {
        date: "05.04.2022",
        breakoutAtt: "9",
        treasure: "2,532 TFUEL",
      },
      {
        date: "06.04.2022",
        breakoutAtt: "4",
        treasure: "1,251 TFUEL",
      },
    ];
    const breakoutTitle = ["Data", "Breakout attendees", "Treasure"];
    const cards = [
      {
        img: cigImage,
        name: "Packet of cigarettes",
        available: 11,
      },
      {
        img: gunImage,
        name: "Gun",
        available: 1,
      },
      {
        img: knifeImage,
        name: "Knife",
        available: 0,
      },
    ];
    const showItem = ref(false);

    // Functions

    const startBreakout = async () => {
      console.log("Working from breakout page.");
    };

    // Returning data
    return {
      iconImage,
      prevBreackout,
      breakoutTitle,
      cards,
      showItem,
      startBreakout,
    };
  },
};
</script>

<style lang="scss" scoped>
.breakout {
  .showcase {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    min-height: 50vh;
    max-width: 95%;
    margin: 20px auto;
    background: #d0d0d0;
    border-radius: 5px;
    h1 {
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      flex-wrap: wrap;
      gap: 20px;
      font-family: "Capture_it";
      font-size: clamp(1rem, 2vw + 2rem, 2.5rem);
      padding: 10px;
      span{
        display: flex;
        align-items: center;
        gap: 10px;
        font-family: "Capture_it";
        img{
          width: 30px;
        }
      }
    }
    .btn {
      margin-top: 50px;
      .action-btn {
        padding: 10px 40px;
        border: 0px;
        border-radius: 10px;
        background: #000;
        color: #fff;
        font-family: "Monaco";
        font-size: 1.2rem;
        text-transform: capitalize;
        cursor: pointer;
      }
    }
  }
  .item-tree {
    max-width: 95%;
    margin: 50px auto;
    border: 1px solid #2222;
    border-radius: 5px;
    padding: 20px;
    .info {
      font-size: clamp(1rem, 2vw + 2rem, 1.5rem);
      padding: 10px 0px;
    }
    .details {
      font-size: clamp(1rem, 2vw + 2rem, 1rem);
    }
    .card-wraper {
      display: flex;
      justify-content: space-between;
      flex-wrap: wrap;
      align-items: center;
      gap: 20px;
      padding: 20px;
      .card {
        display: flex;
        align-items: center;
        min-width: 350px;
        border: 1px solid #2222;
        border-radius: 5px;
        .left {
          img {
            width: 150px;
          }
        }
        .right {
          p {
            font-size: 1rem;
            text-transform: capitalize;
            padding: 5px 0px;
          }
          .input {
            border: 1px solid #5555;
            border-radius: 5px;
            padding: 5px 0px;
            text-indent: 10px;
          }
        }
      }
    }
    .btn {
      margin-top: 50px;
      text-align: center;
      .action-btn {
        padding: 10px 40px;
        border: 0px;
        border-radius: 10px;
        background: #000;
        color: #fff;
        font-family: "Monaco";
        font-size: 1.2rem;
        text-transform: capitalize;
        cursor: pointer;
      }
    }
  }
  .break-title {
    max-width: 95%;
    margin: auto;
    font-family: "Capture_it";
    font-size: clamp(1rem, 2vw + 2rem, 2.5rem);
    padding: 20px 0px;
  }
}

@media only screen and(max-width:410px) {
  .breakout {
    .item-tree {
      padding: 20px 5px;
      .card-wraper {
        .card {
          min-width: 100%;
          .left {
            img {
              width: 100px;
            }
          }
          .right {
            .input {
              width: 98%;
            }
          }
        }
      }
    }
  }
}
</style>