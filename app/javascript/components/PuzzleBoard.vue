<script setup lang="ts">

import Card from "@/components/Card.vue";
import type {SetCard} from "@/types/set-types.ts";
import {useSetGame} from "@/composables/useSetGame.ts";
import {computed} from "vue";
import {getCardId} from "@/set_game/cardHelpers.ts";

const { cards } = defineProps<{ cards: SetCard[] }>();
const emit = defineEmits<{
  'toggle-card': [card: SetCard]
}>();

const { currentSelection, isCardCurrentlySelected } = useSetGame();

const activeCards = computed(() =>
  cards.reduce((acc, card) => {
    acc[getCardId(card)] = isCardCurrentlySelected(card);
    return acc;
  }, {} as Record<string,boolean>)
);
</script>

<template>
  <div class="cards">
    <Card v-for="(card, i) in cards"
          :key="i"
          v-bind="card"
          :class="{'card--active': activeCards[getCardId(card)]}"
          @click="emit('toggle-card', card)"
    />
  </div>
</template>

<style scoped>
.cards {
  display: grid;
  place-items: center;
  grid-template-rows: repeat(3, auto);
  grid-template-columns: repeat(4, 1fr);
  gap: 1rem;
  padding: 1rem;
  max-width: 1000px;
  width: 100%;
  margin: 0 auto;
}
</style>