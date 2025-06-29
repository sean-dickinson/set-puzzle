<script setup lang="ts">

import type {DailyPuzzle} from "@/types/set-types";
import Puzzle from "@/components/Puzzle.vue";

const {puzzle} = defineProps<{
  puzzle: DailyPuzzle;
}>();

</script>

<template>
<puzzle :cards="puzzle.cards">
  <h1>Daily Puzzle for {{puzzle.date}}</h1>
</puzzle>
</template>

<style scoped>
h1 {
  text-align: center;
  margin: 0;
  padding: 0.25rem;
}
</style>