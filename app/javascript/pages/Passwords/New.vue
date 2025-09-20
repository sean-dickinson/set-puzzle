<script setup lang="ts">
import { useForm } from '@inertiajs/vue3';

const {email_address = ''} = defineProps<{ email_address?: string }>();

const form = useForm({
  email_address
});

function submit() {
  form.post('/passwords');
}
</script>
<template>
  <section class="password-new-page">
    <div class="password-new-form">
      <h1>Forgot your password?</h1>
      <form @submit.prevent="submit">
        <div class="form-control">
          <label for="email_address">Email</label>
          <input
            id="email_address"
            type="email"
            v-model="form.email_address"
            required
            autofocus
            autocomplete="username"
            placeholder="Enter your email address"
          />
        </div>
        <button type="submit">Email reset instructions</button>
      </form>
    </div>
  </section>
</template>

<style>
.password-new-page {
  display: grid;
  place-items: center;
  grid-template-columns: repeat(3, 1fr);
  min-height: 100vh;
}

.password-new-form {
  display: flex;
  flex-direction: column;
  gap: 1rem;
  padding: 2rem;
  border: 1px solid #ccc;
  border-radius: 0.5rem;
  background-color: #f9f9f9;
  grid-column: 2 / 3;
  width: 100%;
  max-width: 600px;
}

.form-control {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  padding-bottom: 1rem;
}
</style>

