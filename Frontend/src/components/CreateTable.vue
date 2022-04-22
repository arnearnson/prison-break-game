<template>
  <!-- Create table  -->
  <div class="create-table">
    <!-- Table  -->
    <table class="table">
      <!-- Title tr  -->
      <tr class="title-tr">
        <th v-for="(title, index) in tableTile" :key="index">{{ title }}</th>
      </tr>
      <!-- Data tr  -->
      <tr class="data-tr" v-for="(title, index) in tableData" :key="index">
        <td v-if="title.date">{{ title.date }}</td>
        <td class="item" v-if="title.item">
          <img :src="title.item.img" alt="img" />
          <p>{{ title.item.text }}</p>
        </td>
        <td v-else>{{ title.breakoutAtt }}</td>
        <td>{{ title.treasure }}</td>
      </tr>
    </table>
  </div>
  <!-- Create table  -->
</template>

<script>
// Importing things we need
import { ref } from "@vue/reactivity";
export default {
  name: "CreateTable",
  props: ["tableData", "tableTile"],
  setup(props) {
    // Variables
    const tableData = ref(props.tableData);
    const tableTile = ref(props.tableTile);

    // Returning data
    return { tableData, tableTile };
  },
};
</script>

<style lang="scss" scoped>
.create-table {
  padding: 20px 0px;
  overflow: auto;
  .table {
    width: 95%;
    margin: auto;

    .title-tr {
      text-align: left;
      th {
        border-bottom: 2px solid #2222;
        padding: 10px 0px;
        font-size: clamp(1rem, 1vw + 1rem, 1.8rem);
        font-weight: 400;
      }
    }
    .data-tr {
      text-align: left;
      td {
        border-bottom: 2px solid #2222;
        padding: 15px 0px;
        font-size: clamp(1rem, 1vw + 1rem, 1.2rem);
        font-weight: 400;
      }
      .item {
        display: flex;
        align-items: center;
        gap: 10px;
        img {
          width: 60px;
        }
      }
    }
  }
}
@media only screen and(max-width:660px) {
  .create-table {
    .table {
      width: 100%;
      margin: 10px;
      .title-trP {
        text-align: center;
      }
      .data-tr {
        text-align: center;
      }
    }
  }
}
</style>