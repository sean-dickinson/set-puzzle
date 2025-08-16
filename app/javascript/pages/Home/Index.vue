<script setup lang="ts">

import type {SetCard} from "@/types/set-types.ts";
import Card from "@/components/Card.vue";
import {Link} from "@inertiajs/vue3";

type TodayPuzzle = {
  card: SetCard,
  date: string;
}

const {today} = defineProps<{
  today: TodayPuzzle
}>();
</script>
<template>
  <section class="today">
    <div class="today__header">
      <h1 class="display">Daily Set Puzzle</h1>
      <h2>Play Today's Puzzle</h2>
    </div>
    <Link class="today__card" href="/daily-puzzle">
      <Card v-bind="today.card"/>
    </Link>
  </section>
</template>

<style>
.display {
  font-size: clamp(2rem, 5vw, 3rem);
  margin: 0;
  padding: 0.25rem;
}
.today {
  display: grid;
  grid-template-columns: 1fr 1fr;
  place-content: center;
  height: 100dvh;

  & .today__header, & .today__card {
    display: grid;
    place-content: center;
    text-align: center;

  }

}
</style>
