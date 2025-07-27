<script setup lang="ts">
import PuzzleBoard from "@/components/PuzzleBoard.vue";
import FoundSets from "@/components/FoundSets.vue";
import {useSetGame} from "@/composables/useSetGame.ts";
import type {SetCard} from "@/types/set-types";
import {watch, onMounted, ref} from "vue";

const {cards} = defineProps<{ cards: SetCard[] }>();

const {message, foundSets, isGameOver, toggleSelection} = useSetGame();
const startTime = ref<number>();
const emit = defineEmits<{
  'game-over': [time: number]
}>();
watch(isGameOver, () => {
  if (isGameOver.value) {
    emit('game-over', Date.now() - startTime.value);
  }
})
onMounted(() => {
  startTime.value = Date.now();
})
</script>


<template>
  <main class="puzzle">
    <header>
      <slot />
      <div class="message-container">
        <transition name="fade" mode="out-in">
          <h2 v-if="!!message" :key="message">{{ message }}</h2>
        </transition>
      </div>
    </header>
    <puzzle-board :cards="cards" @toggle-card="toggleSelection"/>
    <found-sets :sets="foundSets"/>
  </main>
</template>

<style scoped>
.puzzle {
  height: 100dvh;
  display: grid;
  grid-template-rows: max-content 1fr;
  grid-template-columns: 2.5fr 1fr;
}
header {
  background: #f0f0f0;
  padding: 0.25rem;
  border-bottom: 2px solid #ccc;
  text-align: center;
  grid-column: 1 / span 2;
  & h2 {
    margin: 0;
    padding: 0.25rem;
  }
}
.fade-enter-active, .fade-leave-active {
  transition: opacity 0.5s;
}
.fade-enter-from, .fade-leave-to {
  opacity: 0;
}
.fade-enter-to, .fade-leave-from {
  opacity: 1;
}
.message-container {
  min-height: 2.5em; /* Adjust as needed for tallest message */
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>

