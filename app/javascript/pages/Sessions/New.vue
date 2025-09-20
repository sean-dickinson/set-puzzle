<script setup lang="ts">
import {useForm, usePage, Link} from '@inertiajs/vue3';

const forgotPasswordUrl = '/passwords/new';

const {email_address} = defineProps<{ email_address?: string }>();

type LoginForm = {
  email_address: string;
  password: string;
};

const form = useForm<LoginForm>({
  email_address: email_address || '',
  password: ''
});

function submit() {
  form.post('/session');
}
</script>
<template>
  <section class="login-page">
    <div class="login-form">

      <form @submit.prevent="submit">
        <div class="form-control">
          <label for="email">Email</label>
          <input
              id="email"
              type="email"
              v-model="form.email_address"
              required
              autofocus
              autocomplete="username"
              placeholder="Enter your email address"
          />
        </div>
        <div class="form-control">
          <label for="password">Password</label>
          <input
              id="password"
              type="password"
              v-model="form.password"
              required
              autocomplete="current-password"
              placeholder="Enter your password"
              maxlength="72"
          />
        </div>
        <button type="submit">Sign in</button>
      </form>
      <Link :href="forgotPasswordUrl">Forgot password?</Link>
    </div>
  </section>
</template>

<style>
.login-page {
  display: grid;
  place-items: center;
  grid-template-columns: repeat(3, 1fr);
  min-height: 100vh;
}

.login-form {
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


