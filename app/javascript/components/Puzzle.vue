<script setup lang="ts">
import PuzzleBoard from "@/components/PuzzleBoard.vue";
import FoundSets from "@/components/FoundSets.vue";
import {useSetGame} from "@/composables/useSetGame.ts";
import type {SetCard} from "@/types/set-types";
import {watchEffect} from "vue";

const {cards} = defineProps<{ cards: SetCard[] }>();

const {errorMessage, foundSets, isGameOver, toggleSelection} = useSetGame();

watchEffect(() => {
  if (isGameOver.value) {
    // Redirect? or do something here
  }
})
</script>


<template>
  <div class="puzzle">
    <header>
      <h2 v-if="!!errorMessage">{{ errorMessage }}</h2>
    </header>
    <section class="game-area">
      <puzzle-board :cards="cards" @toggle-card="toggleSelection"/>
      <found-sets :sets="foundSets"/>
    </section>
  </div>
</template>

<style scoped>
.game-area {
  display: grid;
  grid-template-columns: 4fr 1fr;
  gap: 1rem;
}
</style>