<script setup lang="ts">

import type {PuzzlePreview, SetCard} from "@/types/set-types.ts";
import Card from "@/components/Card.vue";
import {Link} from "@inertiajs/vue3";
import AppHead from "@/components/AppHead.vue";


const {today} = defineProps<{
  today: PuzzlePreview,
  past: PuzzlePreview[]
}>();
</script>
<template>
  <AppHead />
  <section class="section today">
    <div class="today__header">
      <h1 class="display">
        Daily Set Puzzle
      </h1>
      <h2 class="display">
        Play Today's Puzzle!
      </h2>
    </div>
    <div class="today__card">
      <Link  href="/daily-puzzle">
        <Card v-bind="today.card"/>
      </Link>
    </div>
  </section>
  <section v-if="past.length > 0" class="section past">
    <h2>Past Puzzles</h2>
    <div class="past__cards">
      <Link v-for="puzzle in past" :key="puzzle.date" :href="`/puzzles/${puzzle.date}`" class="past-card-link">
        <header>{{puzzle.date}}</header>
        <Card v-bind="puzzle.card"/>
      </Link>
    </div>
  </section>
</template>

<style>
.display {
  font-size: clamp(2rem, 5vw, 3rem);
  margin: 0;
  padding: 0.25rem;
}

.section {
  padding: 1rem;
}
.today {
  display: grid;
  grid-template-columns: 1fr 1fr;
  place-content: center;
  height: min(70dvh, 600px);

  & .today__header, & .today__card {
    display: grid;
    place-content: center;
    text-align: center;

  }
}

.past {
  text-align: center;
}
.past__cards {
  display: grid;
  place-content: center;
  grid-template-columns: repeat(5, 1fr);
  column-gap: 1rem;

  .past-card-link {
    text-decoration: none;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.5rem;
  }
}
</style>
