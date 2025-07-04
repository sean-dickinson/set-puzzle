<script setup lang="ts">

import type {DailyPuzzle} from "@/types/set-types";
import Puzzle from "@/components/Puzzle.vue";
import {computed, ref} from "vue";

const {puzzle} = defineProps<{
  puzzle: DailyPuzzle;
}>();

const isStarted = ref<boolean>(false);
const isGameOver = ref<boolean>(false);
const timeElapsed = ref<number>();
const gameOver = (time: number) => {
  isGameOver.value = true;
  timeElapsed.value = time;
};
const showStartScreen = computed(() => !isStarted.value && !isGameOver.value);
const showPuzzle = computed(() => isStarted.value && !isGameOver.value);
</script>

<template>
  <div v-if="showStartScreen" class="puzzle-start">
    <h1>Daily Puzzle for {{ puzzle.date }}</h1>
    <button @click="isStarted = true">Start Puzzle</button>
  </div>
  <puzzle v-else-if="showPuzzle"
          :cards="puzzle.cards"
          @game-over="gameOver">
    <h1>Daily Puzzle for {{ puzzle.date }}</h1>
  </puzzle>
  <div v-else class="puzzle-game-over">
    <h1>You found them all!</h1>
    <h2>You completed this puzzle in {{ timeElapsed / 1000 }} seconds!</h2>
  </div>
</template>

<style scoped>
h1 {
  text-align: center;
  margin: 0;
  padding: 0.25rem;
}
.puzzle-start, .puzzle-game-over {
  display: grid;
  grid-template-rows: max-content 1fr;
  place-items: center;
  height: 100dvh;

  & button {
    padding: 0.5rem 1rem;
    font-size: 1.25rem;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 0.25rem;
    cursor: pointer;
  }
}
</style>