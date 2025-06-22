<script setup lang="ts">

import type {DailyPuzzle} from "@/types/set-types";
import Puzzle from "@/components/Puzzle.vue";

const {puzzle} = defineProps<{
  puzzle: DailyPuzzle;
}>();

</script>

<template>
<h1>Puzzle for {{puzzle.date}}</h1>
<puzzle :cards="puzzle.cards" />
</template>

<style scoped>

</style>