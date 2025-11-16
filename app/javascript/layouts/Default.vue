<script setup lang="ts">
import {computed} from "vue";
import {usePage} from "@inertiajs/vue3";
import type {GlobalProps} from "@/types/global";

const page = usePage<GlobalProps>();
const hasFlash = computed(() => page.props.flash);
const flashMessages = computed(() => [page.props.flash.alert, page.props.flash.notice].filter(Boolean));
</script>
<template>
<main>
  <header v-if="hasFlash">
    <p v-for="(message, index) in flashMessages" :key="index" class="flash-message">
      {{ message }}
    </p>
  </header>
  <slot />
</main>
</template>