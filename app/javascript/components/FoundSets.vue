<script setup lang="ts">
import type {CardTriad} from "@/set_game/checkSet.ts";
import Card from "@/components/Card.vue";

const {sets} = defineProps<{
  sets: CardTriad[];
}>();
</script>

<template>
  <aside class="found-sets">
    <h3>Found Sets</h3>
    <div class="found-sets__wrapper">
      <div v-for="set in sets" class="set">
        <Card v-for="card in set" v-bind="card"/>
      </div>
    </div>
  </aside>
</template>

<style scoped>
.found-sets {
  text-align: center;
  justify-self: stretch;
  padding: 1rem;

  & .found-sets__wrapper {
    display: grid;
    grid-template-columns: 1fr;
    grid-template-rows: repeat(6, 1fr);
    row-gap: 1rem;
  }

  & .set {
    display: flex;
    gap: 1rem;
  }
}

</style>