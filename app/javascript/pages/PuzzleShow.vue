<script setup lang="ts">
type Card = {
  color: string;
  shape: string;
  number: number;
  shade: string;
}
type Puzzle = {
  cards: Card[];
  date: string;
}
const {puzzle} = defineProps<{puzzle: Puzzle}>();
const cardToString = (card: Card) => {
  const base = `${card.number} ${card.shade}, ${card.color} ${card.shape}`;
  if (card.number === 1) {
    return base;
  } else {
    return `${base}s`;
  }
};
</script>

<template>
<h1>Puzzle for {{puzzle.date}}</h1>
  <div class="cards">
    <div v-for="(card, i) in puzzle.cards" :key="i" class="card">
      {{cardToString(card)}}
    </div>
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