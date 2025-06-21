<script setup lang="ts">

import type {Puzzle} from "@/types/set-types";
import Card from "@/components/Card.vue";

const {puzzle} = defineProps<{
  puzzle: Puzzle;
}>();

</script>

<template>
<h1>Puzzle for {{puzzle.date}}</h1>
  <div class="cards">
    <Card v-for="(card, i) in puzzle.cards" :key="i" v-bind="card" />
  </div>
</template>

<style scoped>
.cards {
  display: grid;
  place-items: center;
  grid-template-columns: repeat(4, minmax(150px, 1fr));
  gap: 1rem;
  padding: 1rem;
}
</style>